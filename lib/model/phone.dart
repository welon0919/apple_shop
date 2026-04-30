enum IphoneColor {
  spaceOrange("宇宙橙色"),
  navyBlue("藏藍色"),
  silver("銀色"),
  skyBlue("天藍色"),
  lightGold("淺金色"),
  cloudWhite("雲白色"),
  spaceBlack("太空黑色"),
  spaceGray("太空灰色"),
  pink("嫩粉色"),
  white("白色"),
  black("黑色"),
  purple("薰衣草紫色"),
  green("鼠尾草綠色"),
  blue("霧藍色"),
  ipadBlue("藍色"),
  ipadPink("粉紅色"),
  ipadYelllow("黃色"),
  ipadPurple("紫色"),
  starLight("星光色");

  const IphoneColor(this.label);
  final String label;
  @override
  String toString() => label;
}

enum Storage {
  s128(128),
  s256(256),
  s512(512),
  s1tb(1024),
  s2tb(2048),
  pro1tb(1024),
  pro2tb(2048);

  const Storage(this.size);
  @override
  String toString() {
    switch (this) {
      case Storage.s128:
        return "128GB";
      case Storage.s256:
        return "256GB";
      case Storage.s512:
        return "512GB";
      case Storage.s1tb:
        return "1TB";
      case Storage.s2tb:
        return "2TB";

      case Storage.pro1tb:
        return "1TB (16GB Ram)";
      case Storage.pro2tb:
        return "2TB (16GB Ram)";
    }
  }

  final int size;
}

enum Model {
  iphone17e(
    {Storage.s256: 19200, Storage.s512: 25600},
    {
      IphoneColor.pink: "assets/phone_images/iphone17_e_pink.png",
      IphoneColor.white: "assets/phone_images/iphone17_e_white.png",
      IphoneColor.black: "assets/phone_images/iphone17_e_black.png",
    },

    "assets/catalog/iphone17_e.png",
  ),

  iphone17(
    {Storage.s256: 25600, Storage.s512: 32000},
    {
      IphoneColor.purple: "assets/phone_images/iphone17_purple.png",
      IphoneColor.green: "assets/phone_images/iphone17_green.png",
      IphoneColor.blue: "assets/phone_images/iphone17_blue.png",
      IphoneColor.white: "assets/phone_images/iphone17_white.png",
      IphoneColor.black: "assets/phone_images/iphone17_black.png",
    },

    "assets/catalog/iphone17.png",
  ),

  iphone17Air(
    {Storage.s256: 30000, Storage.s512: 38000, Storage.s1tb: 45000},
    {
      IphoneColor.skyBlue: "assets/phone_images/iphone17_air_sky_blue.png",
      IphoneColor.lightGold: "assets/phone_images/iphone17_air_light_gold.png",
      IphoneColor.cloudWhite:
          "assets/phone_images/iphone17_air_cloud_white.png",
      IphoneColor.spaceBlack:
          "assets/phone_images/iphone17_air_space_black.png",
    },
    "assets/catalog/iphone17_air.png",
  ),

  iphone17Pro(
    {Storage.s256: 35000, Storage.s512: 41500, Storage.s1tb: 48000},
    {
      IphoneColor.spaceOrange:
          "assets/phone_images/iphone17_pro_space_orange.png",
      IphoneColor.navyBlue: "assets/phone_images/iphone17_pro_navy_blue.png",
      IphoneColor.silver: "assets/phone_images/iphone17_pro_silver.png",
    },

    "assets/catalog/iphone17_pro.png",
  ),

  iphone17ProMax(
    {
      Storage.s256: 38500,
      Storage.s512: 45000,
      Storage.s1tb: 51000,
      Storage.s2tb: 64000,
    },
    {
      IphoneColor.spaceOrange:
          "assets/phone_images/iphone17_pro_max_space_orange.png",
      IphoneColor.navyBlue:
          "assets/phone_images/iphone17_pro_max_navy_blue.png",
      IphoneColor.silver: "assets/phone_images/iphone17_pro_max_silver.png",
    },
    "assets/catalog/iphone17_pro_max.png",
  ),

  ipad11(
    {Storage.s128: 10900, Storage.s256: 14400, Storage.s512: 21400},
    {
      IphoneColor.ipadBlue: "assets/ipad_images/ipad_11th_a16_blue.png",
      IphoneColor.ipadPink: "assets/ipad_images/ipad_11th_a16_pink.png",
      IphoneColor.ipadYelllow: "assets/ipad_images/ipad_11th_a16_yellow.png",
      IphoneColor.silver: "assets/ipad_images/ipad_11th_a16_silver.png",
    },
    "assets/catalog/ipad_11.png",
  ),
  ipadMini7(
    {Storage.s128: 16900, Storage.s256: 20400, Storage.s512: 27400},
    {
      IphoneColor.spaceGray:
          "assets/ipad_images/ipad_mini_a17_pro_space_gray.png",
      IphoneColor.ipadBlue: "assets/ipad_images/ipad_mini_a17_pro_blue.png",
      IphoneColor.ipadPurple: "assets/ipad_images/ipad_mini_a17_pro_purple.png",
      IphoneColor.starLight:
          "assets/ipad_images/ipad_mini_a17_pro_starlight.png",
    },
    "assets/catalog/ipad_mini_7.png",
  ),
  ipadPro11Inch(
    {
      Storage.s256: 32900,
      Storage.s512: 39900,
      Storage.pro1tb: 53900,
      Storage.pro2tb: 67900,
    },
    {
      IphoneColor.spaceBlack:
          "assets/ipad_images/ipad_pro_11_m5_space_black.png",

      IphoneColor.silver: "assets/ipad_images/ipad_pro_11_m5_silver.png",
    },
    "assets/catalog/ipad_pro_11_inch.png",
  ),
  ipadPro13Inch(
    {
      Storage.s256: 43900,
      Storage.s512: 50900,
      Storage.pro1tb: 64900,
      Storage.pro2tb: 78900,
    },
    {
      IphoneColor.spaceBlack:
          "assets/ipad_images/ipad_pro_13_m5_space_black.png",

      IphoneColor.silver: "assets/ipad_images/ipad_pro_13_m5_silver.png",
    },
    "assets/catalog/ipad_pro_13_inch.png",
  ),
  ipadAir11Inch(
    {
      Storage.s128: 19900,
      Storage.s256: 23400,
      Storage.s512: 30400,
      Storage.s1tb: 37400,
    },
    {
      IphoneColor.spaceGray: "assets/ipad_images/ipad_air_11_m4_space_gray.png",
      IphoneColor.ipadBlue: "assets/ipad_images/ipad_air_11_m4_blue.png",
      IphoneColor.ipadPurple: "assets/ipad_images/ipad_air_11_m4_purple.png",
      IphoneColor.starLight: "assets/ipad_images/ipad_air_11_m4_starlight.png",
    },
    "assets/catalog/ipad_air_11_inch.png",
  ),
  ipadAir13Inch(
    {
      Storage.s128: 26900,
      Storage.s256: 30400,
      Storage.s512: 37400,
      Storage.s1tb: 44400,
    },
    {
      IphoneColor.spaceGray: "assets/ipad_images/ipad_air_13_m4_spacegray.png",
      IphoneColor.ipadBlue: "assets/ipad_images/ipad_air_13_m4_blue.png",
      IphoneColor.ipadPurple: "assets/ipad_images/ipad_air_13_m4_purple.png",
      IphoneColor.starLight: "assets/ipad_images/ipad_air_13_m4_starlight.png",
    },
    "assets/catalog/ipad_air_13_inch.png",
  );

  const Model(this.prices, this.colorImages, this.catalogImage);

  final Map<IphoneColor, String> colorImages;
  final Map<Storage, int> prices;
  final String catalogImage;

  List<Storage> getStorageOptions() {
    return prices.keys.toList();
  }

  List<IphoneColor> getColorOptions() {
    return colorImages.keys.toList();
  }

  @override
  String toString() {
    switch (this) {
      case Model.iphone17e:
        return "Iphone 17e";
      case Model.iphone17:
        return "Iphone 17";
      case Model.iphone17Air:
        return "Iphone 17 Air";
      case Model.iphone17Pro:
        return "Iphone 17 Pro";
      case Model.iphone17ProMax:
        return "Iphone 17 Pro Max";

      case Model.ipad11:
        return "Ipad 11 (A16)";
      case Model.ipadMini7:
        return "Ipad mini 7 (A17 Pro)";
      case Model.ipadPro11Inch:
        return "IPad Pro 11吋 (M5)";
      case Model.ipadPro13Inch:
        return "IPad Pro 13吋 (M5)";
      case Model.ipadAir11Inch:
        return "IPad Air 11吋 (M4)";
      case Model.ipadAir13Inch:
        return "IPad Air 13吋 (M4)";
    }
  }
}

class Iphone {
  final Model model;
  final IphoneColor color;
  final Storage storage;

  Iphone(this.model, this.storage, this.color);

  int getPrice() {
    final price = model.prices[storage];
    if (price == null) {
      throw UnsupportedError(
        "Model $model does not support storage ${storage.size}GB",
      );
    }
    return price;
  }

  static List<Model> getModelOptions() {
    return [
      Model.iphone17,
      Model.iphone17Air,
      Model.iphone17Pro,
      Model.iphone17ProMax,
      Model.iphone17e,
    ];
  }

  List<Storage> getStorageOptions() {
    return model.prices.keys.toList();
  }

  String getImage() {
    final image = model.colorImages[color];
    if (image == null) {
      throw UnsupportedError("Model $model does not support color $color");
    }
    return image;
  }

  @override
  String toString() {
    return "${model.toString()} ${color.toString()} ${storage.toString()}";
  }
}
