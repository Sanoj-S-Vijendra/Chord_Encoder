library IEEE;
use IEEE.std_logic_1164.all;

entity testbenchencoder is
end entity;

architecture tb_enc of testbenchencoder is
    signal p: std_logic_vector (3 downto 0);
    signal g: std_logic_vector (1 downto 0);
    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0));
    end component;
begin
    dut_instance: encoder4x2
    port map(I(0)=>p(0), I(1)=>p(1), I(2)=>p(2), I(3)=>p(3), Y(0)=>g(0), Y(1)=>g(1));
    process
    begin
        p(0) <= '1';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 10 ns;
        p(0) <= '0';
        p(1) <= '1';
        p(2) <= '0';
        p(3) <= '0';
        wait for 10 ns;
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '1';
        p(3) <= '0';
        wait for 10 ns;
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '1';
        wait for 10 ns;
    end process;
end architecture;