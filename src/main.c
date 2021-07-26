#include <tty.h>

typedef enum {
    Empty,
    Black,
    White
} cell_state_t;

void kmain(void)
{
    tty_init();

    cell_state_t board[3][3] = {
        { White, Empty, Black },
        { Empty, White, White },
        { Black, Black, Black }
    };
    
    tty_printf("Tic Tac Toe%c%c\n\n", White, Black);
    
    tty_printf("%c %c %c\n", board[0][0], board[0][1], board[0][2]);
    tty_printf("%c %c %c\n", board[1][0], board[1][1], board[1][2]);
    tty_printf("%c %c %c\n", board[2][0], board[2][1], board[2][2]);
}