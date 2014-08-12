package rserve;

import org.rosuda.JRI.Rengine;

public class RJavaConnwin {

    public static void main(String[] args) {
        RJavaConnwin demo = new RJavaConnwin();
        demo.callRJava();
    }

    public void callRJava() {
        Rengine re = new Rengine(new String[] { "--vanilla" }, false, null);
        if (!re.waitForR()) {
            System.out.println("Cannot load R");
            return;
        }
        
        //打印变量
        String version = re.eval("R.version.string").asString();
        System.out.println(version);

        //循环打印数组
        double[] arr = re.eval("rnorm(10)").asDoubleArray();
        for (double a : arr) {
            System.out.print(a + ",");
        }
        re.end();
    }
}
