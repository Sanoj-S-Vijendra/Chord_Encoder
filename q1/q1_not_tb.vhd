library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_not is
end entity;

architecture tb_n of testbench_not is
    signal a: std_logic;
    signal g : std_logic;
    component not_gate1 is
        port(x: in std_logic;
        y: out std_logic);
    end component;
begin
    dut_instance: not_gate1
    port map(x =>a, y => g);
    process
    begin
        a <= '0';
        wait for 1 ns;
        a <= '1';
        wait for 1 ns;
        report "g = " & std_logic'image(g); -- Display the value of g
        wait;
    end process;
end architecture;