library IEEE;
use IEEE.std_logic_1164.all;

entity not_gate1 is
    port(x: in std_logic;
    y: out std_logic);
end entity;

architecture behaviour of not_gate1 is
begin
    y <= not x;
end architecture;