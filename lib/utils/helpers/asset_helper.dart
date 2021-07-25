class AssetHelper {
  AssetHelper._internal();

  factory AssetHelper() => _instance;
  static final AssetHelper _instance = AssetHelper._internal();

  static final String fontAssetsPath = "assets/fonts";
  static final String imageAssetsPath = "assets/images";
  static final String jsonAssetsPath = "assets/animations";

  String getAsset({required String name, AssetType assetType = AssetType.image}) {
    switch (assetType) {
      case AssetType.image:
        return "$imageAssetsPath/$name";
      case AssetType.font:
        return "$fontAssetsPath/$name";
      case AssetType.json:
        return "$jsonAssetsPath/$name";
    }
  }
}

enum AssetType { image, font, json }
