# Switchy

Ruby Application to switch AC loads (e.g. turn a lamp on and off).

Update 2009-09-26: This has actually become something of a
unit-testing light dongle for me. The basic switching hardware was
finished quite early, so the only thing left to do was to add a Killer
Demo App(TM). The basic switching app is just called "switchy", and it
controls individual pins 1 through 10 on the board.

The Killer Demo, then, would be Sparky, Sparcumber, and Autospark.
Each of these has a "christmas tree" LED arrangement: Five LEDs on
each side of the device are wired for run, fail, warning, and pass.
There are two green LEDs for pass on each side, so the pinouts are:

Pins 1-5 (left side): blue, red, yellow, green, green
Pins 10-6 (right side, note reverse order because pin numbering continues
clockwise around the board): blue, red, yellow, green, green

Sparky provides an RSpec progress formatter, so that it gets updated
as each spec runs. While running it animates the LEDs to show the
current overall progress. As each spec finishes an LED of the
appropriate color lights up.

Sparky also has a generic mode. If you run "sparky foo", sparky will
turn on the running lights, then run the foo command. When foo
finishes, its exit status will be used to turn on either the red or
green lights.

Sparcumber does for Cucumber what Sparky does for RSpec. Get Cucumber
configured so you can type "cucumber" from the root of your project,
then type "sparcumber" instead. Sparcumber will light up the board as
Cucumber runs.

Autospark is currently vaporware. All it should do is hook sparky into
autospec. Patches are welcome. There is a spec.sparky.opts file in the
res folder, however, that will achieve this for now, but it does cause
your project to take a dependency on sparky, which in turn requires
having the hardware dongle connected to run your specs, which is less
than agile.


# Example

## Command-line Apps

### Switchy

Switchy gives you control of each light individually.

 $ switchy 1 1 2 0 10 1 8 1
 # => Lights 1, 8, 10 turn on; light 2 turns off

DANGER: This is wildly incompatible with the original design of
switchy. The original design is intended to drive a single external
device from a single pin through a relay.

The prototype design, however, ended up getting optimizing for low
part count, and in fact I just soldered LEDs directly to the logic
board (and there ARE no other parts). This means that each LED is
soldered across TWO pins.

Turning on light 1, for instance, involves driving pin C4 high and
driving pin C5 low.

Remember that when discussing lights, we turn them on or off, but when
discussing the logic pins we drive them high or low, because when you
drive a pin low you are actually establishing a connection between
that pin and ground, allowing current to "sink".

### Sparky

A wrapper on top of switchy that gives you pass/pending/fail
semantics.

 $ sparky (run|pass|pending|fail)
 # => turns on running|green|yellow|red lights

 $ sparky <system command> [<command options>]

 # => Turns on run lights and executise shell command. If the exit
 #    code is 0, turns green. Any other exit code and it turns red.

### Sparcumber

Sparcumber is a cucumber wrapper. It hooks into Cucumber's
AST::Visitor class. Use it like you would use Cucumber:

  $ sparcumber -r features features/

One additional bit of cleverness: While running, each step that
passes/pends/fails will turn on ONE light of the appropriate color. If
another step exits in the same condition, that color light will
advance (E.g. the currently lit green light will go out and the next
one will turn on). This provides the visual effect of animating the
feature output. Note that it is thus possible to 5 leds lit at once:
the 2 running lights plus one each of red, yellow and green.

## Ruby Library

TODO: The ruby lib is pretty messed up. Here's what currently works:

    s = Switchy.new
    s.set_pin Switchy::PINS::D6, 0
    # Drives pin D6 low (which turns on the on-board LED)
    s.set_pin Switchy::PINS::B3, 1
    # Drives pin B3 high

# The Hardware

...is currently very much in flux.

TODO: Write me!

# TODO

- There's an enable line on the 74ls244 driver chip. Use it. Device
  should boot disabled. Once everything's had a chance to settle
  (10-100ms or so), enable the driver chip.

- [TODO] Add circuit schematics to the project.

- [DONE] Fork the circuit, make a version with just a little LED light
  bar and no 120VAC switching. (Trust me. The little LEDs are VERY
  compelling!)

- [TODO] Fork this whole project. The tiny LEDs have become the
  end-all-be-all of the project. Build a circuit diagram and just
  bless this project as the GP(no-I)O controller that it is.

- [TODO] Add duty cycles to the downloadable and to the API. So
  switchy 1 0.5 would turn on LED 1 at 50% brightness.

- [TODO] [MAYBE] Add timers? E.g. switchy 1 0.5 50 would turn on LED 1
  for 50ms. Of this and the previous feature I'd rather have duty
  cycle, but the chip blocks while waiting on USB I/O so dono if this
  is feasible.

- [TODO] [MAAAAYBE???] Add programs to the circuit. So you send a
  sequence of lights, brightnesses and durations to the chip and
  whether or not the instruction set loops. (Experiment: Ward
  Cunningham built a fairly complicated scheduler, and got away with
  it because he did it all on the host rather than down in the
  chip. How fast is USB? Can we actually achieve duty cycle switching
  speeds?)

- [ABANDONED] Add duty cycling/blinking to the board. (Tabled for now.
  The USB serial port driver that comes with the Teensy board appears
  to use blocking methods. The code libraries are poorly documented
  and will require a significantly higher amount of expertise with AVR
  programming than I currently have before I can port it to a
  non-blocking form.)

- [TODO] Write a simulator for the 6.3E+06-1 people on the planet who
  do not have the only existing prototype. I think a little MacRuby
  Red/Green/Refactor applet would be spiffy all by itself--and would
  make debugging/testing driver and linking apps much easier.

- [DONE] 2009-04-20: Review previous TODOs in light of first finished
  prototype.

- [DONE] Change progress formatter lights, and light up only one
  pass/fail/pending LED as specs run. As each example completes,
  animate the display by moving the the one led to another spot. So if
  all your specs are passing, you'll see the green light move 1 -> 2
  -> 3 -> 4 -> 1 -> 2 etc. If you have any pending specs, they will
  light up 1 -> 2 -> 1 -> 2 etc. When the test finishes, light up all
  the status lights of the appropriate color.
