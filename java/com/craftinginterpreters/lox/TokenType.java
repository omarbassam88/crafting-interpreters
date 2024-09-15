package com.craftinginterpreters.lox;

enum TokenType {
    // Single Character Tokens
    LEFT_PAREN, RIGHT_PAREN, LEFT_BRACE, RIGHT_BRACE,
    COMMA, DOT, MINUS, PLUS, SEMICOLON, SLASH, STAR,

    // One or Two character tokens
    BANG, BANG_EQUAL,
    EQUAL, EQUAL_EQUAL,
    GREATER, GREATER_EQUAL,
    LESS, LESS_EQUAL,

    // Literals
    IDENTIFIER, STRING, NUMBER,

    // Keywords
    AND, OR, TRUE, FALSE, NIL,
    IF, ELSE, FOR, WHILE,
    CLASS, THIS, FUN, VAR,
    RETURN, PRINT, SUPER,

    EOF
}
