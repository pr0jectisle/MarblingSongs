import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

class Sound {

  boolean[][] act;
  float[] pitchArray;
  boolean[] onsetArray;
  float[] ampArray;
  int fr;
  
  float pitch;
  boolean onset;
  float amp;

  boolean started = false;
  boolean txtFile;

  Sound(String file) {
    readfile(file);
  }

  void readfile(String filePath) {
    String[] lines = loadStrings(filePath);

    int fr = int(lines[0]);
    //this.fr = fr;
    int nb = int(lines[1]);
    //this.bands = nb;
    int numLines = lines.length-2;
    boolean[][] act = new boolean[numLines][nb];
    float[] pitchArr = new float[numLines];
    boolean[] onsetArr = new boolean[numLines];
    float[] ampArr = new float[numLines];

    for (int i = 2; i < lines.length; i++) {
      String[] elements = splitTokens(lines[i]);

      for (int j = 0; j < elements.length; j++) {
        if (j<nb) {
          act[i - 2][j] = parseBoolean(elements[j]);
        } else if (j == nb) {
          pitchArr[i-2] = parseFloat(elements[j]);
        } else if (j == nb+1) {
          onsetArr[i-2] = parseBoolean(elements[j]);
        } else if (j == nb+2) {
          float a = parseFloat(elements[j]);
          ampArr[i-2] = a;
        }
      }
    }
    this.act = act;
    this.pitchArray = pitchArr;
    this.onsetArray = onsetArr;
    this.ampArray = ampArr;
  }
  void update(int fc) {

    this.pitch = pitchArray[fc];
    this.onset = onsetArray[fc];
    this.amp = ampArray[fc];
    if ((!started) && pitch != 0) { //pitch != 0
      started = true;
      println("----------------------------STARTED " + frameCount + "----------------------------");
    }
  }
}
