library IEEE;
use IEEE.std_logic_1164.all;

entity decoder4x16 is
    port(a, b, c, d, enable: in std_logic;
    dec: out std_logic_vector(15 downto 0));
end entity;

architecture decodingnew of decoder4x16 is

    signal decode: std_logic_vector(3 downto 0);
    signal v1: std_logic;
    signal v2: std_logic;

    component not_gate1 is
        port(x: in std_logic;
        y: out std_logic);
    end component;

    component decoder2x4 is
        port(a, b, enable: in std_logic;
        decd: out std_logic_vector(3 downto 0));
    end component;

begin
    not1: not_gate1
    port map(x =>c, y => v1);
    not2: not_gate1
    port map(x =>d, y => v2);
    decoder1: decoder2x4
    port map(a=>a, b=>b, enable=>'1', decd(0)=>decode(0), decd(1)=>decode(1), decd(2)=>decode(2), decd(3)=>decode(3));
    decoder2: decoder2x4
    port map(a=>v1, b=>v2, enable=>decode(0), decd(0)=>dec(0), decd(1)=>dec(1), decd(2)=>dec(2), decd(3)=>dec(3));
    decoder3: decoder2x4
    port map(a=>v1, b=>d, enable=>decode(1), decd(0)=>dec(4), decd(1)=>dec(5), decd(2)=>dec(6), decd(3)=>dec(7));
    decoder4: decoder2x4
    port map(a=>c, b=>v2, enable=>decode(2), decd(0)=>dec(8), decd(1)=>dec(9), decd(2)=>dec(10), decd(3)=>dec(11));
    decoder5: decoder2x4
    port map(a=>c, b=>d, enable=>decode(3), decd(0)=>dec(12), decd(1)=>dec(13), decd(2)=>dec(14), decd(3)=>dec(15));
end architecture;