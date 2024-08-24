library IEEE;
use IEEE.std_logic_1164.all;

entity testbenchdecoder is
end entity;

architecture tb_dec of testbenchdecoder is
    signal f: std_logic;
    signal g: std_logic;
    signal h: std_logic;
    signal j: std_logic;
    signal k: std_logic;
    signal l: std_logic_vector(15 downto 0);
    component decoder4x16 is
        port(a, b, c, d, enable: in std_logic;
        dec: out std_logic_vector(15 downto 0));
    end component;
begin
    dut_instance: decoder4x16
    port map(a=>f, b=>g, c=>h, d=>j, enable=>k, dec(15 downto 0)=> l(15 downto 0));
    process
    begin
        k <= '1';
        for q in std_logic range '1' downto '0' loop
            f <= q;
            for w in std_logic range '1' downto '0' loop
                g <= w;
                for e in std_logic range '1' downto '0' loop
                    h <= e;
                    for r in std_logic range '1' downto '0' loop
                        j <= r;
                        wait for 1 ns;
                    end loop;
                end loop;
            end loop;
        end loop;
    end process;
end architecture;