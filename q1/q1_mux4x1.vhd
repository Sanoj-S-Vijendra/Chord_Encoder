library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end entity; 

architecture working of mux4x1 is

    signal a1 : std_logic;
    signal a2 : std_logic;
    signal a3 : std_logic;
    signal a4 : std_logic;
    signal a5 : std_logic;
    signal a6 : std_logic;
    signal a7 : std_logic;
    signal a8 : std_logic;
    signal a9 : std_logic;
    signal a10 : std_logic;
    signal a11 : std_logic;
    signal a12 : std_logic;

    component AND_Gate1 is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;
    
    component or_gate1 is
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
    port map(x =>S(0), y => a1);
    not2: not_gate1
    port map(x =>S(1), y => a2);
    and1: AND_Gate1
    port map(x1 => a1, x2 => a2, y => a3);
    and2: AND_Gate1
    port map(x1 => S(0), x2 => a2, y => a4);
    and3: AND_Gate1
    port map(x1 => a1, x2 => S(1), y => a5);
    and4: AND_Gate1
    port map(x1 => S(0), x2 => S(1), y => a6);
    and5: AND_Gate1
    port map(x1 => a3, x2 => D(0), y => a7);
    and6: AND_Gate1
    port map(x1 => a4, x2 => D(1), y => a8);
    and7: AND_Gate1
    port map(x1 => a5, x2 => D(2), y => a9);
    and8: AND_Gate1
    port map(x1 => a6, x2 => D(3), y => a10);
    or1: or_gate1
    port map(x1 => a7, x2 => a8, y => a11);
    or2: or_gate1
    port map(x1 => a9, x2 => a10, y => a12);
    or3: or_gate1
    port map(x1 => a11, x2 => a12, y => Y);
end architecture;
