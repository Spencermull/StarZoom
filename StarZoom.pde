import processing.core.PApplet;
import java.util.Random;

public class StarZoom extends PApplet {
  int numStars = 500; // Number of stars in the universe
  Star[] stars; // Array to hold the star objects
  int zoomedIndex = -1; // Index of the currently zoomed star (-1 means no star is zoomed)
  float zoomScale = 2; // Zoom scale

  public void settings() {
    size(800, 600); // Set the size of the sketch window
  }

  public void setup() {
    // Initialize the array of stars
    stars = new Star[numStars];
    for (int i = 0; i < numStars; i++) {
      float x = random(width); // Random x-coordinate
      float y = random(height); // Random y-coordinate
      float size = random(1, 7); // Random size of the star
      float speed = random(0.5, 2); // Random speed of the star
      color c = color(random(255), random(255), random(255)); // Random color of the star
      String name = generateStarName(); // Generate a random star name
      stars[i] = new Star(x, y, size, speed, c, name);
    }
  }

  public void draw() {
    background(0); // Clear the background

    if (zoomedIndex != -1) {
      // Zoomed view
      translate(width / 2, height / 2); // Translate to the center of the screen
      scale(zoomScale); // Apply zoom scale
      translate(-stars[zoomedIndex].x, -stars[zoomedIndex].y); // Translate to the zoomed star

      // Display the zoomed star with its unique properties
      stars[zoomedIndex].displayZoomed();
    } else {
      // Normal view
      // Display and update the stars
      for (int i = 0; i < numStars; i++) {
        stars[i].display();
        stars[i].update();
      }
    }

    // Display the statistics of the universe
    displayStatistics();
  }

  // Function to display the statistics of the universe
  void displayStatistics() {
    fill(255, 200); // Set the fill color to white with transparency
    textSize(18); // Set the text size
    text("Procedurally Generated Universe", 20, 20);
    text("Number of Stars: " + numStars, 20, 50);
    text("Average Star Size: " + calculateAverageSize(), 20, 80);
    text("Average Star Speed: " + calculateAverageSpeed(), 20, 110);
    text("Press backspace to zoom in on a star", 20, 140);
    text("Press any other key to exit zoom mode", 20, 170);
  }

  // Function to calculate the average size of the stars
  float calculateAverageSize() {
    float totalSize = 0;
    for (int i = 0; i < numStars; i++) {
      totalSize += stars[i].size;
    }
    return totalSize / numStars;
  }

  // Function to calculate the average speed of the stars
  float calculateAverageSpeed() {
    float totalSpeed = 0;
    for (int i = 0; i < numStars; i++) {
      totalSpeed += stars[i].speed;
    }
    return totalSpeed / numStars;
  }

  public void keyPressed() {
    if (keyCode == BACKSPACE) {
      // Randomly select a star to zoom in
      zoomedIndex = floor(random(numStars));
    } else {
      // Exit zoom mode
      zoomedIndex = -1;
    }
  }

  // Star class
  class Star {
    float x, y; // Coordinates of the star
    float size; // Size of the star
    float speed; // Speed of the star's movement
    color c; // Color of the star
    String name; // Name of the star
    int temperature; // Temperature of the star

    Star(float x, float y, float size, float speed, color c, String name) {
      this.x = x;
      this.y = y;
      this.size = size;
      this.speed = speed;
      this.c = c;
      this.name = name;
      this.temperature = getTemperature();
    }

    // Display the star

    void display() {
      noStroke();
      fill(c);
      ellipse(x, y, size, size);
    }

    // Update the star's position
    void update() {
      x += speed;
      if (x > width) {
        x = 0;
      }
    }

    // Display the zoomed star with its unique properties
    void displayZoomed() {
      fill(c);
      stroke(255);
      strokeWeight(2);
      ellipse(x, y, size * 4, size * 4);

      // Display star properties
      fill(255);
      textSize(16);
      textAlign(LEFT, TOP);
      text("Star Name: " + name, x, y - 40);
      text("Star Color: " + getColorString(), x, y);
      text("Star Size: " + (int) size, x, y + 40); // Cast size to an integer
      text("Star Temperature: " + temperature, x, y + 80);
    }

    // Get the color string representation of the star's color
    String getColorString() {
      int r = (int) red(c);
      int g = (int) green(c);
      int b = (int) blue(c);
      String colorString = "#" + hex(r, 2) + hex(g, 2) + hex(b, 2);
      return colorString;
    }

    // Get the stored temperature of the star
    int getTemperature() {
      return (int) random(2000, 30000);
    }
  }

  // Get a random star name inspired by science
  String generateStarName() {
    String[] prefixes = {"Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Zeta", "Eta", "Theta"};
    String[] suffixes = {"Centauri", "Orionis", "Cygni", "Pegasi", "Lyrae", "Canis", "Aquarii", "Ursae"};

    Random rand = new Random();
    String prefix = prefixes[rand.nextInt(prefixes.length)];
    String suffix = suffixes[rand.nextInt(suffixes.length)];
    return prefix + " " + suffix;
  }

  public static void main(String[] args) {
    PApplet.main("StarZoom");
  }
}
