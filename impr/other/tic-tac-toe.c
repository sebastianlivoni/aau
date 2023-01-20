#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define GRID_SIZE 9          // must be in format n^d (must be a perfect square)
#define DEFAULT_PLAYER 1 // either 1 or 2

typedef enum
{
  Cross = 1,
  Nought = 2
} Players;

typedef struct Game {
  Players grid[GRID_SIZE];
  Players turn;
} Game;

void play_round();
int continuous_read_input(Players turn);
int have_correct_grid(int grid);
void choose_player(Players *turn);
int is_space_avaliable(Players *grid, int space);
void print_board(Players *grid);
int check_grid(Players *grid);
int check_grid_horizontal(Players *grid);
int check_grid_vertical(Players *grid);
int check_grid_diagonal(Players *grid);
int check_points(int *arr);
char *enum_in_text(Players player);


int main() {
  int winner;

  Game *Game = malloc(sizeof(Game));
  Game->turn = DEFAULT_PLAYER;

  printf("\e[1;1H\e[2J");

  if (!have_correct_grid(GRID_SIZE)) {
    printf("Invalid grid! Change this constant named 'GRID_SIZE'.\n");
    return EXIT_FAILURE;
  }

  choose_player(&Game->turn);

  print_board(Game->grid);
  for (int i = 0; i < GRID_SIZE; i++) {
    play_round(Game);
    if ((winner = check_grid(Game->grid))) {
      print_board(Game->grid);
      printf("\e[1mThe game ended. Winner was: %s\e[m\n", (winner == Cross) ? "X" : "O");
      break;
    }
    print_board(Game->grid);
  }

  if (!winner) {
    print_board(Game->grid);
    printf("\e[1mThe game ended. Draw!\e[m\n");
  }

  return EXIT_SUCCESS;
}

int have_correct_grid(int grid) {
  int s = sqrt(grid);
  if (s * s == grid)
    return 1;
  else
    return 0;
}

void choose_player(Players *turn) {
  printf("Please choose either X or O:\n");
  printf("1 : Play as X\n");
  printf("2 : Play as O\n");
  printf("Enter your choice => ");
  scanf("%d", turn);
}

void play_round(Game *game) {
  int space;

  do {
    space = continuous_read_input(game->turn);
  } while (!is_space_avaliable(game->grid, space));

  game->grid[space] = game->turn;
  game->turn = (game->turn == Cross) ? Nought : Cross;
}

int continuous_read_input(Players turn) {
  int read = 0, integer;
  do
  {
    printf("\e[1mTurn is: %s\e[m\n", enum_in_text(turn));
    printf("Please enter an integer between 1 and %d => ", GRID_SIZE);
    read = scanf(" %d", &integer);
    getchar();
  } while (read == 0 || integer == 0);

  return integer - 1;
}

int is_space_avaliable(Players *grid, int space) {
  if (grid[space])
  {
    printf("Space is not avaliable. Please pick another space!\n");
    return 0;
  }
  return 1;
}

void print_board(Players *grid) {
  int total = 0;

  printf("\e[1;1H\e[2J");
  printf("+ - + - + - +\n");
  for (int i = 0; i < GRID_SIZE; i++) {
    printf("| \e[1m%s\e[m ", enum_in_text(grid[i]));
    if ((i + 1) % (int)sqrt(GRID_SIZE) == 0)
      printf("|\n+ - + - + - +\n");
  }
}

int check_grid(Players *grid) {
  int horizontal, vertical, diagonal;

  horizontal = check_grid_horizontal(grid);
  vertical = check_grid_vertical(grid);
  diagonal = check_grid_diagonal(grid);

  if (horizontal)
    return horizontal;
  if (vertical)
    return vertical;
  if (diagonal)
    return diagonal;

  return 0;
}

int check_grid_horizontal(Players *grid) {
  int winner;
  int horizontal[3] = {0, 0, 0};

  for (int i = 0; i < GRID_SIZE; i++) {
    horizontal[grid[i]] += 1;

    if ((winner = check_points(horizontal)))
      return winner;

    if ((i + 1) % (int)sqrt(GRID_SIZE) == 0) {
      horizontal[Cross] = 0;
      horizontal[Nought] = 0;
    }
  }

  return 0;
}

int check_grid_vertical(Players *grid)
{
  int winner;
  int vertical[3] = {0, 0, 0};

  for (int i = 0; i < (int)sqrt(GRID_SIZE); i++) {
    for (int j = 0; j < GRID_SIZE; j += (int)sqrt(GRID_SIZE)) {
      vertical[grid[i + j]] += 1;

      if ((winner = check_points(vertical)))
        return winner;
    }

    vertical[Cross] = 0;
    vertical[Nought] = 0;
  }

  return 0;
}

int check_grid_diagonal(Players *grid) {
  int winner;
  int diagonal[3] = {0, 0, 0};

  // NW to SE
  for (int i = 0; i < GRID_SIZE; i += (int)sqrt(GRID_SIZE) + 1) {
    diagonal[grid[i]] += 1;

    if ((winner = check_points(diagonal)))
      return winner;
  }

  memset(diagonal, 0, sizeof(diagonal));

  // NE to SW
  for (int i = (int)sqrt(GRID_SIZE) - 1; i < GRID_SIZE - ((int)sqrt(GRID_SIZE) - 1); i += (int)sqrt(GRID_SIZE) - 1) {
    diagonal[grid[i]] += 1;

    if ((winner = check_points(diagonal)))
      return winner;
  }

  return 0;
}

int check_points(int *arr) {
  if (arr[Cross] == (int)sqrt(GRID_SIZE) || arr[Nought] == (int)sqrt(GRID_SIZE)) {
    return (arr[Cross] == (int)sqrt(GRID_SIZE)) ? Cross : Nought;
  }

  return 0;
}

char *enum_in_text(Players player) {
  char *symbol;
  switch (player) {
    case Cross:
      symbol = "X";
      break;
    case Nought:
      symbol = "O";
      break;
    default:
      symbol = " ";
  }
  return symbol;
}