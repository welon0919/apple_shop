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
  iphone17e({
    Storage.s256: 19200,
    Storage.s512: 25600,
  }, "assets/phone_images/iphone17_e.png"),

  iphone17({
    Storage.s256: 25600,
    Storage.s512: 32000,
  }, "assets/phone_images/iphone17.png"),

  iphone17Air({
    Storage.s256: 30000,
    Storage.s512: 38000,
    Storage.s1tb: 45000,
  }, "assets/phone_images/iphone17_air.png"),

  iphone17Pro({
    Storage.s256: 35000,
    Storage.s512: 41500,
    Storage.s1tb: 48000,
  }, "assets/phone_images/iphone17_pro.png"),

  iphone17ProMax({
    Storage.s256: 38500,
    Storage.s512: 45000,
    Storage.s1tb: 51000,
    Storage.s2tb: 64000,
  }, "assets/phone_images/iphone17_pro_max.png");

  const IphoneModel(this.prices, this.imagePath);
  List<Storage> getStorageOptions() {
    return prices.keys.toList();
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

  final Map<Storage, int> prices;
  final String imagePath;
}

class Iphone {
  final IphoneModel model;
  final Storage storage;

  Iphone(this.model, this.storage);

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
    return model.imagePath;
  }

  @override
  String toString() {
    return "${model.toString()} ${storage.toString()}";
  }
}
