class Instrument {
  String port;
  PShape icon;
  int[] notes;
  
  Instrument( String port, String icon, int[] notes ) {
    this.port = port;
    this.icon = loadShape(icon);
    this.icon.disableStyle();
    this.notes = notes;
  }
}