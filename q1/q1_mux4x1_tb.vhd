library IEEE;
use IEEE.std_logic_1164.all;

entity testbenchmux4x1 is
end entity;

architecture tb_mux of testbenchmux4x1 is
    signal p: std_logic_vector (3 downto 0);
    signal q: std_logic_vector (1 downto 0);
    signal g: std_logic;
    component mux4x1 is
        port(D: in std_logic_vector (3 downto 0);
        S: in std_logic_vector(1 downto 0);
        Y: out std_logic);
    end component;
begin
    dut_instance: mux4x1
    port map(D(0)=>p(0), D(1)=>p(1), D(2)=>p(2), D(3)=>p(3), S(0)=>q(0), S(1)=>q(1), Y=>g);
    process
    begin
        q(0) <= '0';
        q(1) <= '0';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '0';
        q(1) <= '0';
        p(0) <= '1';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '0';
        q(1) <= '0';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '0';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '0';
        p(0) <= '0';
        p(1) <= '1';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '0';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '0';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '0';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '1';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '0';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '1';
        wait for 1 ns;
        q(0) <= '1';
        q(1) <= '1';
        p(0) <= '0';
        p(1) <= '0';
        p(2) <= '0';
        p(3) <= '0';
        wait for 1 ns;
        report "g = " & std_logic'image(g); -- Display the value of g
        wait;
    end process;
end architecture;