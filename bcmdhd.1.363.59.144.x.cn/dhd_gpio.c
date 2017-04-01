
#include <osl.h>
#include <dhd_linux.h>

#ifdef CONFIG_MACH_ODROID_4210
#include <mach/gpio.h>
#include <mach/regs-gpio.h>
#include <plat/gpio-cfg.h>
#include <plat/sdhci.h>
#include <plat/devs.h>
#define	sdmmc_channel	s3c_device_hsmmc0
#endif

#if defined(CUSTOMER_HW_INTEL) && defined(BCMSDIO)
#include <linux/mmc/core.h>
#include <linux/mmc/card.h>
#include <linux/mmc/host.h>
#include <linux/mmc/sdio_func.h>
#include <linux/gpio.h>
#endif

#include <linux/amlogic/aml_gpio_consumer.h>
extern int wifi_irq_trigger_level(void);
#ifdef CUSTOMER_HW_AMLOGIC
extern  void sdio_reinit(void);
extern void extern_wifi_set_enable(int is_on);
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 14, 0))
extern int wifi_irq_num(void);
#endif
#endif

extern u8 *wifi_get_mac(void);
#ifndef CUSTOMER_HW_AMLOGIC
#define WL_REG_ON 0 // WL_REG_ON is the input pin of WLAN module
#define WL_HOST_WAKE 0 // WL_HOST_WAKE is output pin of WLAN module
#endif

struct wifi_platform_data dhd_wlan_control = {0};

#ifdef CUSTOMER_OOB
uint bcm_wlan_get_oob_irq(void)
{
#ifndef CUSTOMER_HW_AMLOGIC
	int wl_host_wake = WL_HOST_WAKE;
#endif
	uint host_oob_irq = 0;

#ifndef CUSTOMER_HW_AMLOGIC
	printf("GPIO(WL_HOST_WAKE) = %d\n", wl_host_wake);
	if (gpio_request(wl_host_wake, "bcmdhd") < 0) {
		printf("%s: gpio_request failed\n", __FUNCTION__);
	}
	host_oob_irq = gpio_to_irq(wl_host_wake);
	if (gpio_direction_input(wl_host_wake) < 0 ) {
		printf("%s: gpio_direction_input failed\n", __FUNCTION__);
	}
#endif

#ifdef CUSTOMER_HW_AMLOGIC
#if (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 0))
	host_oob_irq = INT_GPIO_4;
#else
	host_oob_irq = wifi_irq_num();
#endif
#endif
	printf("host_oob_irq: %d\n", host_oob_irq);

	return host_oob_irq;
}

void bcm_wlan_free_oob_gpio(uint irq_num)
{
#ifndef CUSTOMER_HW_AMLOGIC
	if (irq_num) {
		printf("%s: gpio_free(%d)\n", __FUNCTION__, WL_HOST_WAKE);
		gpio_free(WL_HOST_WAKE);
	}
#endif
}

uint bcm_wlan_get_oob_irq_flags(void)
{
	uint host_oob_irq_flags = 0;

#ifdef HW_OOB
	if (wifi_irq_trigger_level() == GPIO_IRQ_LOW)
		host_oob_irq_flags = IORESOURCE_IRQ | IORESOURCE_IRQ_LOWLEVEL | IORESOURCE_IRQ_SHAREABLE;
	else
		host_oob_irq_flags = IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHLEVEL | IORESOURCE_IRQ_SHAREABLE;

#else
	host_oob_irq_flags = IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE | IORESOURCE_IRQ_SHAREABLE;
#endif

	printf("host_oob_irq_flags=0x%X\n", host_oob_irq_flags);

	return host_oob_irq_flags;
}
#endif

int
bcm_wlan_set_power(bool on
#ifdef CUSTOMER_HW_INTEL
, wifi_adapter_info_t *adapter
#endif
)
{
	int err = 0;
#ifndef CUSTOMER_HW_AMLOGIC
	uint wl_reg_on = WL_REG_ON;
#endif

	if (on) {
		printf("======== PULL WL_REG_ON HIGH! ========\n");
#ifdef CONFIG_MACH_ODROID_4210
		err = gpio_set_value(wl_reg_on, 1);
#endif
#if defined(CUSTOMER_HW_INTEL) & defined(BCMSDIO)
		if (adapter->sdio_func && adapter->sdio_func->card && adapter->sdio_func->card->host) {
			printf("======== mmc_power_restore_host! ========\n");
			mmc_power_restore_host(adapter->sdio_func->card->host);
		}
#endif
#ifdef CUSTOMER_HW_AMLOGIC
		extern_wifi_set_enable(0);
		mdelay(200);
		extern_wifi_set_enable(1);
		mdelay(200);
//		sdio_reinit();
#endif
		/* Lets customer power to get stable */
		mdelay(100);
	} else {
#if defined(CUSTOMER_HW_INTEL) & defined(BCMSDIO)
		if (adapter->sdio_func && adapter->sdio_func->card && adapter->sdio_func->card->host) {
			printf("======== mmc_power_save_host! ========\n");
			mmc_power_save_host(adapter->sdio_func->card->host);
		}
#endif
		printf("======== PULL WL_REG_ON LOW! ========\n");
#ifdef CONFIG_MACH_ODROID_4210
		err = gpio_set_value(wl_reg_on, 0);
#endif
#ifdef CUSTOMER_HW_AMLOGIC
//		extern_wifi_set_enable(0);
//		mdelay(200);
#endif
	}

	return err;
}

int bcm_wlan_set_carddetect(bool present)
{
	int err = 0;

	if (present) {
		printf("======== Card detection to detect SDIO card! ========\n");
#ifdef CONFIG_MACH_ODROID_4210
		err = sdhci_s3c_force_presence_change(&sdmmc_channel, 1);
#endif
#ifdef CUSTOMER_HW_AMLOGIC
		sdio_reinit();
#endif
	} else {
		printf("======== Card detection to remove SDIO card! ========\n");
#ifdef CONFIG_MACH_ODROID_4210
		err = sdhci_s3c_force_presence_change(&sdmmc_channel, 0);
#endif
#ifdef CUSTOMER_HW_AMLOGIC
		extern_wifi_set_enable(0);
		mdelay(200);
#endif
	}

	return err;
}

int bcm_wlan_get_mac_address(unsigned char *buf)
{
	int err = 0;

	printf("======== %s ========\n", __FUNCTION__);
#ifdef EXAMPLE_GET_MAC
	/* EXAMPLE code */
	{
		struct ether_addr ea_example = {{0x00, 0x11, 0x22, 0x33, 0x44, 0xFF}};
		bcopy((char *)&ea_example, buf, sizeof(struct ether_addr));
	}
#endif /* EXAMPLE_GET_MAC */
	bcopy((char *)wifi_get_mac(), buf, sizeof(struct ether_addr));
	if (buf[0] == 0xff) {
		printf("custom wifi mac is not set\n");
		err = -1;
	}
	return err;
}

#ifdef CONFIG_DHD_USE_STATIC_BUF
extern void *bcmdhd_mem_prealloc(int section, unsigned long size);
void* bcm_wlan_prealloc(int section, unsigned long size)
{
	void *alloc_ptr = NULL;
	alloc_ptr = bcmdhd_mem_prealloc(section, size);
	if (alloc_ptr) {
		printf("success alloc section %d, size %ld\n", section, size);
		if (size != 0L)
			bzero(alloc_ptr, size);
		return alloc_ptr;
	}
	printf("can't alloc section %d\n", section);
	return NULL;
}
#endif

#if !defined(WL_WIRELESS_EXT)
struct cntry_locales_custom {
	char iso_abbrev[WLC_CNTRY_BUF_SZ];	/* ISO 3166-1 country abbreviation */
	char custom_locale[WLC_CNTRY_BUF_SZ];	/* Custom firmware locale */
	int32 custom_locale_rev;		/* Custom local revisin default -1 */
};
#endif

static struct cntry_locales_custom brcm_wlan_translate_custom_table[] = {
	/* Table should be filled out based on custom platform regulatory requirement */
	{"",   "XT", 49},  /* Universal if Country code is unknown or empty */
	{"US", "US", 0},
};

#ifdef CUSTOM_FORCE_NODFS_FLAG
struct cntry_locales_custom brcm_wlan_translate_nodfs_table[] = {
	{"",   "XT", 50},  /* Universal if Country code is unknown or empty */
	{"US", "US", 0},
};
#endif

static void *bcm_wlan_get_country_code(char *ccode
#ifdef CUSTOM_FORCE_NODFS_FLAG
	, u32 flags
#endif
)
{
	struct cntry_locales_custom *locales;
	int size;
	int i;

	if (!ccode)
		return NULL;

#ifdef CUSTOM_FORCE_NODFS_FLAG
	if (flags & WLAN_PLAT_NODFS_FLAG) {
		locales = brcm_wlan_translate_nodfs_table;
		size = ARRAY_SIZE(brcm_wlan_translate_nodfs_table);
	} else {
#endif
		locales = brcm_wlan_translate_custom_table;
		size = ARRAY_SIZE(brcm_wlan_translate_custom_table);
#ifdef CUSTOM_FORCE_NODFS_FLAG
	}
#endif

	for (i = 0; i < size; i++)
		if (strcmp(ccode, locales[i].iso_abbrev) == 0)
			return &locales[i];
	return NULL;
}

int bcm_wlan_set_plat_data(void) {
	printf("======== %s ========\n", __FUNCTION__);
	dhd_wlan_control.set_power = bcm_wlan_set_power;
	dhd_wlan_control.set_carddetect = bcm_wlan_set_carddetect;
	dhd_wlan_control.get_mac_addr = bcm_wlan_get_mac_address;
#ifdef CONFIG_DHD_USE_STATIC_BUF
	dhd_wlan_control.mem_prealloc = bcm_wlan_prealloc;
#endif
	dhd_wlan_control.get_country_code = bcm_wlan_get_country_code;
	return 0;
}

