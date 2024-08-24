library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate1 is
    port(x1: in std_logic;
    x2: in std_logic;
    y: out std_logic);
end entity;

architecture behaviour of or_gate1 is
begin
    y <= x1 or x2;
end architecture;