# StarZoom

StarZoom is a small Processing sketch that procedurally generates a simple "universe" of colorful stars and lets you zoom in on a single star to view its properties. It's written using the Processing API and packaged as a single sketch/class (StarZoom.pde).


Features
- Procedurally generates a field of colorful stars.
- Each star has randomized position, size, speed, color and a generated name.
- Zoom into a randomly selected star to view its details (name, color, size, temperature).
- Simple on-screen statistics (number of stars, average size, average speed).

Controls
- Backspace: Zoom in on a random star.
- Any other key: Exit zoom mode.

Requirements
- Processing 3.x or 4.x (Processing IDE recommended), or:
- Java 8+ and processing-core.jar if you prefer to run from the command line.

Files
- StarZoom.pde — main sketch (class StarZoom extends PApplet).
- README.md — this file.

How to run

Using the Processing IDE (recommended)
1. Open Processing.
2. Open StarZoom.pde.
3. Click the Run button.

Using the processing-java command line
1. Install Processing and ensure `processing-java` is available on your PATH.
2. From the directory containing the sketch folder (the folder should contain StarZoom.pde), run:
   processing-java --sketch=`pwd` --run
3. The sketch window should open.

Running as a Java program (advanced)
You can compile/run the sketch as a Java program using processing-core.jar:

1. Locate your processing-core.jar (usually in the Processing installation, e.g. `processing-3.x.x/core/library/processing-core.jar`).
2. Rename StarZoom.pde to StarZoom.java (optional — the Processing IDE handles .pde automatically).
3. Compile:
   javac -cp /path/to/processing-core.jar StarZoom.java
4. Run:
   java -cp .:/path/to/processing-core.jar StarZoom

Notes and customization
- Tweak parameters in StarZoom.pde:
  - numStars — number of stars.
  - zoomScale — how much to scale the zoomed view.
  - star size and speed ranges are set when stars are created.
- The sketch currently selects a random star to zoom when Backspace is pressed. You can modify the code to pick the nearest star to the mouse, or select by index.

Implementation details
- Each star is represented by an inner Star class with properties: x, y, size, speed, color, name and temperature.
- Stars are animated by moving them horizontally; when they pass the right edge, they wrap to x = 0.
- Zooming is implemented with translate() and scale() so the selected star is centered and enlarged.

Contributing
- Feel free to open issues or pull requests for bug fixes, feature requests, or enhancements.
- Ideas:
  - Add mouse-based selection for zooming.
  - Add parallax layers or twinkling effects.
  - Add UI to filter or search stars by name or properties.

License
This project is provided under the MIT License. See LICENSE for details (or add an appropriate LICENSE file to the repo).

Author
Spencermull

Acknowledgements
Built with Processing — https://processing.org

