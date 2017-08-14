package rosetta;

import java.util.function.Function;

/**
 * Integrates input function K over time
 *  S + (K(t1) + K(t0)) * (t1 - t0) / 2
 *
 *
 */
public class Integrator {

	private Function<Long, Double> f;
	private double s, lastS;
	private long t0, t1;
	private volatile boolean run;

	public Integrator(Function<Long, Double> input) {
		this.s = 0;
		this.lastS = 0;
		this.t0 = System.currentTimeMillis();
		setInput(input);
		run = true;
		new Thread(() -> {
			while (run) {
				try {
					Thread.sleep(1);
					update();
				} catch (InterruptedException e) {
					e.printStackTrace();
					System.exit(1);
				}
			}
		}).start();
	}

	private void update() {
		long t = System.currentTimeMillis() - this.t0;
		double v = this.f.apply(t);
		this.s += (lastS + v) * (t - this.t1) / 2;
		this.t1 = t;
	}

	public void setInput(Function<Long, Double> input) {
		this.f = input;
		lastS = input.apply(0L);
		t1 = 0;
	}

	public double getOutput() {
		return s;
	}
	
	public void stop() {
		run = false;
	}
	
	public static void main(String[] args) throws InterruptedException {
		Integrator i = new Integrator((t) -> Math.sin(Math.PI * t));
		Thread.sleep(2000);
		i.setInput((t) -> 0.);
		Thread.sleep(500);
		System.out.println(i.getOutput());
		i.stop();
	}
}
