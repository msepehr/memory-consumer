package com.oom;
import java.util.Vector;
public class MemoryConsumer {
    private static float CAP = 0.91f;  // 80%
    private static int ONE_MB = 1024 * 1024;
    private static Vector cache = new Vector();
    private static String memTest = System.getenv("MEM_TEST");
    public static void main(String[] args) {
        while(true) {
            try {
                Thread.sleep(3000);
            } catch (Exception e) {
                throw RuntimeException(e);
            }
            int memTestInt = 1;
            if(memTest != null && memTest.length() != 0){
                memTestInt = Integer.parseInt(memTest);
            }
            Runtime rt = Runtime.getRuntime();
            long maxMemBytes = rt.maxMemory();
            long usedMemBytes = rt.totalMemory() - rt.freeMemory();
            long freeMemBytes = rt.maxMemory() - usedMemBytes;
            int allocBytes = Math.round(freeMemBytes * CAP);
            System.out.println("Initial free memory: " + freeMemBytes/ONE_MB + "MB");
            System.out.println("Max memory: " + maxMemBytes/ONE_MB + "MB");
            System.out.println("Reserve: " + allocBytes/ONE_MB + "MB");
            for (int i = 0; i < allocBytes / ONE_MB; i++){
                cache.add(new byte[ONE_MB * memTestInt]);
            }
            usedMemBytes = rt.totalMemory() - rt.freeMemory();
            freeMemBytes = rt.maxMemory() - usedMemBytes;
            System.out.println("Free memory: " + freeMemBytes/ONE_MB + "MB");
        }
    }
}