-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.4
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rgb_mux is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    video_in_stream_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    video_in_stream_TVALID : IN STD_LOGIC;
    video_in_stream_TREADY : OUT STD_LOGIC;
    video_in_stream_TUSER : IN STD_LOGIC;
    video_in_stream_TLAST : IN STD_LOGIC;
    video_out_stream_TDATA : OUT STD_LOGIC_VECTOR (23 downto 0);
    video_out_stream_TVALID : OUT STD_LOGIC;
    video_out_stream_TREADY : IN STD_LOGIC;
    video_out_stream_TUSER : OUT STD_LOGIC;
    video_out_stream_TLAST : OUT STD_LOGIC;
    mux_V : IN STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of rgb_mux is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "rgb_mux,hls_ip_2015_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=2.740000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=106,HLS_SYN_LUT=89}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm0_0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_ST_st2_fsm1_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_ST_st3_fsm2_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_ST_st0_fsm1_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st0_fsm2_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";

    signal ap_rst_n_inv : STD_LOGIC;
    signal video_in_stream_data_V_tmp_reg_212 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_CS_fsm0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm0 : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm0_0 : STD_LOGIC;
    signal ap_sig_bdd_35 : BOOLEAN;
    signal ap_CS_fsm1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding of ap_CS_fsm1 : signal is "none";
    signal ap_sig_cseq_ST_st2_fsm1_1 : STD_LOGIC;
    signal ap_sig_bdd_51 : BOOLEAN;
    signal ap_CS_fsm2 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding of ap_CS_fsm2 : signal is "none";
    signal ap_sig_ioackin_video_out_stream_TREADY : STD_LOGIC;
    signal ap_sig_cseq_ST_st3_fsm2_1 : STD_LOGIC;
    signal ap_sig_bdd_66 : BOOLEAN;
    signal ap_reg_ppstg_video_in_stream_data_V_tmp_reg_212_pp0_it1 : STD_LOGIC_VECTOR (23 downto 0);
    signal video_in_stream_tuser_tmp_reg_218 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppstg_video_in_stream_tuser_tmp_reg_218_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal video_in_stream_tlast_tmp_reg_223 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppstg_video_in_stream_tlast_tmp_reg_223_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal R_fu_105_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal R_reg_228 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_reg_ppstg_R_reg_228_pp0_it1 : STD_LOGIC_VECTOR (7 downto 0);
    signal G_reg_234 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_reg_ppstg_G_reg_234_pp0_it1 : STD_LOGIC_VECTOR (7 downto 0);
    signal B_reg_240 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_reg_ppstg_B_reg_240_pp0_it1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_2_fu_129_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_fu_135_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_fu_141_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp6_demorgan_fu_147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp2_fu_158_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp7_fu_168_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_read_fu_70_p4_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_read_fu_70_p4_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ioackin_video_out_stream_TREADY : STD_LOGIC := '0';
    signal sel_tmp1_fu_153_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal sel_tmp6_fu_163_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_1_fu_180_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal p_s_fu_173_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal or_cond_fu_193_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal newSel_fu_187_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal newSel9_fu_197_p3 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_NS_fsm0 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm1 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_NS_fsm2 : STD_LOGIC_VECTOR (1 downto 0);


begin




    -- the current state (ap_CS_fsm0) of the state machine. --
    ap_CS_fsm0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm0 <= ap_ST_st1_fsm0_0;
            else
                ap_CS_fsm0 <= ap_NS_fsm0;
            end if;
        end if;
    end process;


    -- the current state (ap_CS_fsm1) of the state machine. --
    ap_CS_fsm1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm1 <= ap_ST_st0_fsm1_0;
            else
                ap_CS_fsm1 <= ap_NS_fsm1;
            end if;
        end if;
    end process;


    -- the current state (ap_CS_fsm2) of the state machine. --
    ap_CS_fsm2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm2 <= ap_ST_st0_fsm2_0;
            else
                ap_CS_fsm2 <= ap_NS_fsm2;
            end if;
        end if;
    end process;


    -- ap_reg_ioackin_video_out_stream_TREADY assign process. --
    ap_reg_ioackin_video_out_stream_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_video_out_stream_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1) and not((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY))))) then 
                    ap_reg_ioackin_video_out_stream_TREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1) and (ap_const_logic_1 = video_out_stream_TREADY)))) then 
                    ap_reg_ioackin_video_out_stream_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((video_in_stream_TVALID = ap_const_logic_0) or ((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1)))))) then
                B_reg_240 <= video_in_stream_TDATA(23 downto 16);
                G_reg_234 <= video_in_stream_TDATA(15 downto 8);
                R_reg_228 <= R_fu_105_p1;
                video_in_stream_data_V_tmp_reg_212 <= video_in_stream_TDATA;
                video_in_stream_tlast_tmp_reg_223 <= empty_read_fu_70_p4_2;
                video_in_stream_tuser_tmp_reg_218 <= empty_read_fu_70_p4_1;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1))))) then
                ap_reg_ppstg_B_reg_240_pp0_it1 <= B_reg_240;
                ap_reg_ppstg_G_reg_234_pp0_it1 <= G_reg_234;
                ap_reg_ppstg_R_reg_228_pp0_it1 <= R_reg_228;
                ap_reg_ppstg_video_in_stream_data_V_tmp_reg_212_pp0_it1 <= video_in_stream_data_V_tmp_reg_212;
                ap_reg_ppstg_video_in_stream_tlast_tmp_reg_223_pp0_it1 <= video_in_stream_tlast_tmp_reg_223;
                ap_reg_ppstg_video_in_stream_tuser_tmp_reg_218_pp0_it1 <= video_in_stream_tuser_tmp_reg_218;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm1) of the state machine. --
    ap_NS_fsm1_assign_proc : process (video_in_stream_TVALID, ap_sig_cseq_ST_st1_fsm0_0, ap_CS_fsm1, ap_sig_ioackin_video_out_stream_TREADY, ap_sig_cseq_ST_st3_fsm2_1)
    begin
        case ap_CS_fsm1 is
            when ap_ST_st2_fsm1_1 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1))) and not((video_in_stream_TVALID = ap_const_logic_0)))) then
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                elsif ((not(((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1))) and (not((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and (video_in_stream_TVALID = ap_const_logic_0))))) then
                    ap_NS_fsm1 <= ap_ST_st0_fsm1_0;
                else
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                end if;
            when ap_ST_st0_fsm1_0 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((video_in_stream_TVALID = ap_const_logic_0) or ((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1)))))) then
                    ap_NS_fsm1 <= ap_ST_st2_fsm1_1;
                else
                    ap_NS_fsm1 <= ap_ST_st0_fsm1_0;
                end if;
            when others =>  
                ap_NS_fsm1 <= "XX";
        end case;
    end process;

    -- the next state (ap_NS_fsm2) of the state machine. --
    ap_NS_fsm2_assign_proc : process (ap_sig_cseq_ST_st2_fsm1_1, ap_CS_fsm2, ap_sig_ioackin_video_out_stream_TREADY, ap_sig_cseq_ST_st3_fsm2_1)
    begin
        case ap_CS_fsm2 is
            when ap_ST_st3_fsm2_1 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY)))) then
                    ap_NS_fsm2 <= ap_ST_st3_fsm2_1;
                elsif ((not((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY)) and not((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1)))) then
                    ap_NS_fsm2 <= ap_ST_st0_fsm2_0;
                else
                    ap_NS_fsm2 <= ap_ST_st3_fsm2_1;
                end if;
            when ap_ST_st0_fsm2_0 => 
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm1_1) and not(((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1))))) then
                    ap_NS_fsm2 <= ap_ST_st3_fsm2_1;
                else
                    ap_NS_fsm2 <= ap_ST_st0_fsm2_0;
                end if;
            when others =>  
                ap_NS_fsm2 <= "XX";
        end case;
    end process;

    -- the next state (ap_NS_fsm0) of the state machine. --
    ap_NS_fsm0_assign_proc : process (video_in_stream_TVALID, ap_CS_fsm0, ap_sig_ioackin_video_out_stream_TREADY, ap_sig_cseq_ST_st3_fsm2_1)
    begin
        case ap_CS_fsm0 is
            when ap_ST_st1_fsm0_0 => 
                ap_NS_fsm0 <= ap_ST_st1_fsm0_0;
            when others =>  
                ap_NS_fsm0 <= "X";
        end case;
    end process;
    R_fu_105_p1 <= video_in_stream_TDATA(8 - 1 downto 0);

    -- ap_rst_n_inv assign process. --
    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    -- ap_sig_bdd_35 assign process. --
    ap_sig_bdd_35_assign_proc : process(ap_CS_fsm0)
    begin
                ap_sig_bdd_35 <= (ap_CS_fsm0(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_51 assign process. --
    ap_sig_bdd_51_assign_proc : process(ap_CS_fsm1)
    begin
                ap_sig_bdd_51 <= (ap_const_lv1_1 = ap_CS_fsm1(1 downto 1));
    end process;


    -- ap_sig_bdd_66 assign process. --
    ap_sig_bdd_66_assign_proc : process(ap_CS_fsm2)
    begin
                ap_sig_bdd_66 <= (ap_const_lv1_1 = ap_CS_fsm2(1 downto 1));
    end process;


    -- ap_sig_cseq_ST_st1_fsm0_0 assign process. --
    ap_sig_cseq_ST_st1_fsm0_0_assign_proc : process(ap_sig_bdd_35)
    begin
        if (ap_sig_bdd_35) then 
            ap_sig_cseq_ST_st1_fsm0_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm0_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm1_1 assign process. --
    ap_sig_cseq_ST_st2_fsm1_1_assign_proc : process(ap_sig_bdd_51)
    begin
        if (ap_sig_bdd_51) then 
            ap_sig_cseq_ST_st2_fsm1_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm1_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st3_fsm2_1 assign process. --
    ap_sig_cseq_ST_st3_fsm2_1_assign_proc : process(ap_sig_bdd_66)
    begin
        if (ap_sig_bdd_66) then 
            ap_sig_cseq_ST_st3_fsm2_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st3_fsm2_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_ioackin_video_out_stream_TREADY assign process. --
    ap_sig_ioackin_video_out_stream_TREADY_assign_proc : process(video_out_stream_TREADY, ap_reg_ioackin_video_out_stream_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_video_out_stream_TREADY)) then 
            ap_sig_ioackin_video_out_stream_TREADY <= video_out_stream_TREADY;
        else 
            ap_sig_ioackin_video_out_stream_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    empty_read_fu_70_p4_1 <= (0=>video_in_stream_TUSER, others=>'-');
    empty_read_fu_70_p4_2 <= (0=>video_in_stream_TLAST, others=>'-');
    newSel9_fu_197_p3 <= 
        p_s_fu_173_p4 when (tmp_2_fu_129_p2(0) = '1') else 
        ap_reg_ppstg_video_in_stream_data_V_tmp_reg_212_pp0_it1;
    newSel_fu_187_p3 <= 
        ap_reg_ppstg_video_in_stream_data_V_tmp_reg_212_pp0_it1 when (sel_tmp7_fu_168_p2(0) = '1') else 
        p_1_fu_180_p4;
    or_cond_fu_193_p2 <= (sel_tmp7_fu_168_p2 or sel_tmp2_fu_158_p2);
    p_1_fu_180_p4 <= ((ap_reg_ppstg_G_reg_234_pp0_it1 & ap_reg_ppstg_B_reg_240_pp0_it1) & ap_reg_ppstg_R_reg_228_pp0_it1);
    p_s_fu_173_p4 <= ((ap_reg_ppstg_B_reg_240_pp0_it1 & ap_reg_ppstg_R_reg_228_pp0_it1) & ap_reg_ppstg_G_reg_234_pp0_it1);
    sel_tmp1_fu_153_p2 <= (tmp_2_fu_129_p2 xor ap_const_lv1_1);
    sel_tmp2_fu_158_p2 <= (tmp_9_fu_135_p2 and sel_tmp1_fu_153_p2);
    sel_tmp6_demorgan_fu_147_p2 <= (tmp_2_fu_129_p2 or tmp_9_fu_135_p2);
    sel_tmp6_fu_163_p2 <= (sel_tmp6_demorgan_fu_147_p2 xor ap_const_lv1_1);
    sel_tmp7_fu_168_p2 <= (tmp_s_fu_141_p2 and sel_tmp6_fu_163_p2);
    tmp_2_fu_129_p2 <= "1" when (mux_V = ap_const_lv2_1) else "0";
    tmp_9_fu_135_p2 <= "1" when (mux_V = ap_const_lv2_2) else "0";
    tmp_s_fu_141_p2 <= "1" when (mux_V = ap_const_lv2_3) else "0";

    -- video_in_stream_TREADY assign process. --
    video_in_stream_TREADY_assign_proc : process(video_in_stream_TVALID, ap_sig_cseq_ST_st1_fsm0_0, ap_sig_ioackin_video_out_stream_TREADY, ap_sig_cseq_ST_st3_fsm2_1)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm0_0) and not(((video_in_stream_TVALID = ap_const_logic_0) or ((ap_const_logic_0 = ap_sig_ioackin_video_out_stream_TREADY) and (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1))))))) then 
            video_in_stream_TREADY <= ap_const_logic_1;
        else 
            video_in_stream_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    video_out_stream_TDATA <= 
        newSel_fu_187_p3 when (or_cond_fu_193_p2(0) = '1') else 
        newSel9_fu_197_p3;
    video_out_stream_TLAST <= ap_reg_ppstg_video_in_stream_tlast_tmp_reg_223_pp0_it1(0);
    video_out_stream_TUSER <= ap_reg_ppstg_video_in_stream_tuser_tmp_reg_218_pp0_it1(0);

    -- video_out_stream_TVALID assign process. --
    video_out_stream_TVALID_assign_proc : process(ap_sig_cseq_ST_st3_fsm2_1, ap_reg_ioackin_video_out_stream_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm2_1) and (ap_const_logic_0 = ap_reg_ioackin_video_out_stream_TREADY)))) then 
            video_out_stream_TVALID <= ap_const_logic_1;
        else 
            video_out_stream_TVALID <= ap_const_logic_0;
        end if; 
    end process;

end behav;