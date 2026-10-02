#pragma once

#include <stdint.h>

#define BOOT_MAGIC "ANDROID!"
#define BOOT_MAGIC_SIZE 8

struct boot_img_hdr_v0 {
    uint8_t  magic[8];

    uint32_t kernel_size;
    uint32_t kernel_addr;

    uint32_t ramdisk_size;
    uint32_t ramdisk_addr;

    uint32_t second_size;
    uint32_t second_addr;

    uint32_t tags_addr;
    uint32_t page_size;

    uint32_t header_version;
    uint32_t os_version;

    uint8_t  name[16];
    uint8_t  cmdline[512];

    uint32_t id[8];

    uint8_t  extra_cmdline[1024];
};

struct boot_img_hdr_v3 {
    uint8_t  magic[8];

    uint32_t kernel_size;
    uint32_t ramdisk_size;

    uint32_t os_version;

    uint8_t  header_size[4];

    uint32_t reserved[4];

    uint32_t header_version;

    uint8_t  cmdline[1536];
};

struct boot_img_hdr_v4 {
    uint8_t  magic[8];

    uint32_t kernel_size;
    uint32_t ramdisk_size;

    uint32_t os_version;

    uint8_t  header_size[4];

    uint32_t reserved[4];

    uint32_t header_version;

    uint8_t  cmdline[1536];

    uint32_t signature_size;
};
