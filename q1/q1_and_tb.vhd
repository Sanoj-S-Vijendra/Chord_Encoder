library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_and is
end entity;

architecture tb_a of testbench_and is
    signal a,b : std_logic;
    signal g : std_logic;
    component AND_Gate1 is
        port(x1: in std_logic;
        x2: in std_logic;
        y: out std_logic);
    end component;
begin
    dut_instance: AND_Gate1
    port map(x1 => a, x2 => b, y => g);
    process
    begin
        a <= '0';
        b <= '0';
        wait for 1 ns;
        a <= '1';
        b <= '0';
        wait for 1 ns;
        a <= '0';
        b <= '1';
        wait for 1 ns;
        a <= '1';
        b <= '1';
        wait for 1 ns;
        report "g = " & std_logic'image(g); -- Display the value of g
        wait;
    end process;
end architecture;