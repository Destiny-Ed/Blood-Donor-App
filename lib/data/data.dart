class SliderModel{
  String imagePath;
  String imagePat;
  String title;
  String desc;
  String des;
  String dec;
  SliderModel({this.imagePath, this.title, this.desc , this.imagePat, this.des, this.dec});
  void setImageAssetPath(String getImagepath){
    imagePath=getImagepath;
  }
  void setImageAssetPat(String getImagepat){
    imagePat=getImagepat;
  }
  void setTitle(String getTitle){
    title=getTitle;
  }

  void setDesc(String getDesc){
    desc=getDesc;
  }
  void setDes(String getDes){
    des=getDes;
  }

  void setDec(String getDec){
    dec=getDec;
  }
  String getImageAssetPath(){
    return imagePath;
  }
  String getImageAssetPat(){
    return imagePat;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }
  String getDes(){
    return des;
  }
  String getDec(){
    return dec;
  }
}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel= new SliderModel();

  sliderModel.setImageAssetPath("assets/BLOOD13.png");
  sliderModel.setImageAssetPat("assets/blood20.png");
  sliderModel.setTitle(" WELCOME TO AN ONLINE BLOOD DONATION SYSTEM ");
  sliderModel.setDesc(" Were you can search for the nearest blood donor, view the list of donors, send and accept request, receive notification ");
  sliderModel.setDes(" swipe to the right or click on Next or Skip below.....");
  sliderModel.setDec("");
  slides.add(sliderModel);

  sliderModel=new SliderModel();
  sliderModel.setImageAssetPath("assets/blood20.png");
  sliderModel.setImageAssetPat("assets/BLOOD13.png");
  sliderModel.setTitle("TIPS ON HOW TO USE THE APP");
  sliderModel.setDesc("You must register first to be able to donate or search for donors.");
  sliderModel.setDes(" Blood Donor : If you are a donor, once you are done with your registration, login with your username and email. Once you are log on, turn on your PHONE LOCATION to authomatically pick your location, then you will see the ( + ) icon, click"
      " on it and enter your medical information and then click on DONATE ");
  sliderModel.setDec("Blood Receiver : If you are a blood receiver, once you are done with registration, proceed to log in. once you are log on, turn on your PHONE LOCATION to authomatically pick your location, click the search icon and"
      " enter your Blood group and Rhesus Factor to search for the nearest donor and send a request message to the donor");
  slides.add(sliderModel);










  return slides;
}