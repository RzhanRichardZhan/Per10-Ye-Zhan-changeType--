class Keyboard {
    boolean holdingUp, holdingRight, holdingLeft, holdingSpace;

    Keyboard() {
        holdingUp = holdingRight = holdingLeft = holdingSpace = false;
    }

    void keyPressed() {
       switch (key) {
              case 'W':
                if(!holdingUp){
                  holdingUp = false;
                }else{
                  holdingUp = true;
                }
                break;
              case 'A':
                if(!holdingDown){
                  holdingLeft = false;
                }else{
                  holdingLeft = true;
                }
                break;
              case 'D':
                if(!holdingRight){
                  holdingRight = false;
                }else{
                  holdingRight = true;
                }
                break;
              case ' ':
                if(!holdingSpace){
                  holdingSpace = false;
                }else{
                  holdingSpace = true;
                }
                break;
            }
    }
}
