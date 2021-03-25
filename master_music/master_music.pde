import processing.sound.*;

SoundFile C5;

void setup()
{
  size(1000, 1000);
  C5 = new SoundFile(this, "audio\\Ensoniq-SQ-1-Violin-1-C5.wav");
}

void draw()
{
  noFill();
  rect(100, 100, 100, 100);
}

void mouseClicked() {
  if (mouseX>100 && mouseX<200 && mouseY>100 && mouseY<200)
    C5.play();
}
