library IEEE;
use IEEE.std_logic_1164.all;

entity decoder2x4 is
    port(a, b, enable: in std_logic;
    decd: out std_logic_vector(3 downto 0));
end entity;

architecture decoding of decoder2x4 is

    signal v1: std_logic;
    signal v2: std_logic;
    signal s: std_logic_vector(3 downto 0);

    component AND_Gate1 is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;

    component not_gate1 is
        port(x: in std_logic;
        y: out std_logic);
    end component;

begin
    not1: not_gate1
    port map(x =>a, y => v1);
    not2: not_gate1
    port map(x =>b, y => v2);
    and1: AND_Gate1
    port map(x1 => v1, x2 => v2, y => s(0));
    and2: AND_Gate1
    port map(x1 => v1, x2 => b, y => s(1));
    and3: AND_Gate1
    port map(x1 => a, x2 => v2, y => s(2));
    and4: AND_Gate1
    port map(x1 => a, x2 => b, y => s(3));
    and5: AND_Gate1
    port map(x1 => s(0), x2 => enable, y => decd(0));
    and6: AND_Gate1
    port map(x1 => s(1), x2 => enable, y => decd(1));
    and7: AND_Gate1
    port map(x1 => s(2), x2 => enable, y => decd(2));
    and8: AND_Gate1
    port map(x1 => s(3), x2 => enable, y => decd(3));
end architecture;