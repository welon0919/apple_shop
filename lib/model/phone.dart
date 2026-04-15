enum IphoneColor {
  spaceOrange("宇宙橙色"),
  navyBlue("藏藍色"),
  silver("銀色"),
  skyBlue("天藍色"),
  lightGold("淺金色"),
  cloudWhite("雲白色"),
  spaceBlack("宇宙黑色"),
  pink("嫩粉色"),
  white("白色"),
  black("黑色"),
  purple("薰衣草紫色"),
  green("鼠尾草綠色"),
  blue("霧藍色");

  const IphoneColor(this.label);
  final String label;
  @override
  String toString() => label;
}

enum Storage {
  s256(256),
  s512(512),
  s1tb(1024),
  s2tb(2048);

  const Storage(this.size);
  @override
  String toString() {
    switch (this) {
      case Storage.s256:
        return "256GB";
      case Storage.s512:
        return "512GB";
      case Storage.s1tb:
        return "1TB";
      case Storage.s2tb:
        return "2TB";
    }
  }

  final int size;
}

enum IphoneModel {
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
  );

  const IphoneModel(this.prices, this.colorImages, this.catalogImage);

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
      case IphoneModel.iphone17e:
        return "Iphone 17e";
      case IphoneModel.iphone17:
        return "Iphone 17";
      case IphoneModel.iphone17Air:
        return "Iphone 17 Air";
      case IphoneModel.iphone17Pro:
        return "Iphone 17 Pro";
      case IphoneModel.iphone17ProMax:
        return "Iphone 17 Pro Max";
    }
  }
}

class Iphone {
  final IphoneModel model;
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

  static List<IphoneModel> getModelOptions() {
    return [
      IphoneModel.iphone17,
      IphoneModel.iphone17Air,
      IphoneModel.iphone17Pro,
      IphoneModel.iphone17ProMax,
      IphoneModel.iphone17e,
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
