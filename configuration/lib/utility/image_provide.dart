String logo = 'logo.jpg'.fromAssets;

extension AssetsImage on String{
  get fromAssets => 'assets/images/${this}';
}