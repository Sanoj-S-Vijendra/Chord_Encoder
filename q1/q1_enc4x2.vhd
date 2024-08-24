library IEEE;
use IEEE.std_logic_1164.all;

entity encoder4x2 is
    port(I: in std_logic_vector (3 downto 0);
    Y: out std_logic_vector(1 downto 0));
end entity;

architecture encoding of encoder4x2 is

    component or_gate1 is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

begin
    or11: or_gate1
    port map(x1 => I(2), x2 => I(3), y => Y(0));
    or21: or_gate1
    port map(x1 => I(1), x2 => I(3), y => Y(1));
end architecture;