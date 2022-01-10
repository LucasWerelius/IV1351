package se.kth.iv1351.musicjdbc.startup;

import se.kth.iv1351.musicjdbc.controller.Controller;
import se.kth.iv1351.musicjdbc.integration.MusicDBException;
import se.kth.iv1351.musicjdbc.view.BlockingInterpreter;

public class Main {
    public static void main(String[] args) {
        try {
        new BlockingInterpreter(new Controller()).handleCmds();
        } catch(MusicDBException bdbe) {
            System.out.println("Could not connect to Music db.");
            bdbe.printStackTrace();
        }
    }
}
