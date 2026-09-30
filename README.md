### Example 2: Design of a serial parity detector.

* A continuous stream of bits is fed to a circuit in synchronism with a clock. The circuit will be generating a bit stream as output, where a `0` will indicate "even number of 1's seen so far" and a `1` will indicate "odd number of 1's seen so far".
* Also a **Moore Machine**.

#### State Transition Diagram Details:
* **Inputs/Outputs notation on transitions:** `input / output`
* **States:**
  * **`EVEN`** (Initial State): Outputs `0`
  * **`ODD`**: Outputs `1`
* **Transitions:**
  * From `EVEN`: Loop back to `EVEN` if input is `0` (`0/0`). Go to `ODD` if input is `1` (`1/1`).
  * From `ODD`: Loop back to `ODD` if input is `0` (`0/1`). Go to `EVEN` if input is `1` (`1/0`).
