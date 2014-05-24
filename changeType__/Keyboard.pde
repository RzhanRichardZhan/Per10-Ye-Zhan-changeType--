import java.awt.event.KeyEvent;

class Keyboard {
    Boolean holdingUp, holdingDown, holdingRight, holdingLeft, holdingSpace;

    Keyboard() {
        holdingUp = holdingDown = holdingRight = holdingLeft = holdingSpace = false;
    }

    void pressKey(int key) {

        if (key == KeyEvent.VK_UP) {
            holdingUp = true;
        }
        if (key == KeyEvent.VK_DOWN) {
            holdingDown = true;
        }
        if (key == KeyEvent.VK_LEFT) {
            holdingLeft = true;
        }
        if (key == KeyEvent.VK_RIGHT) {
            holdingRight = true;
        }
        if (key == KeyEvent.VK_SPACE) {
            holdingSpace = true;
        }
    }
    void releaseKey(int key) {
        if (key == KeyEvent.VK_UP) {
            holdingUp = false;
        }
        if (key == KeyEvent.VK_DOWN) {
            holdingDown = false;
        }
        if (key == KeyEvent.VK_LEFT) {
            holdingLeft = false;
        }
        if (key == KeyEvent.VK_RIGHT) {
            holdingRight = false;
        }
        if (key == KeyEvent.VK_SPACE) {
            holdingSpace = false;
        }
    }
}
