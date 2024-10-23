// In Memorian John Higgins. Alvin Lucier. 1987.
// oscillator. mono

/*
This is a Supercollider program that performs the OSCILLATOR part of "In Memorian John Higgins" by Alvin Lucier.

From the original score
http://www2.tate.org.uk/intermediaart/mp3/alvinlucierpdfs/jon_higgins_clarinet_score.pdf

the instructions realated to the oscillator:

OSCILLATOR

A slow sweep, pure wave oscillator is routed through an amplifier to a single loudspeaker, positioned Stage Right.
The sweep width is set from 130.8 Hz to 1244.5 Hz; the sweep rate at 30 seconds per semitone. At the beginning of the peformance the volume of the amplifier is raised from zero to a level at which the audible beats are vivid for listeners; then the wave is allowed to sweep upward uninterruptedly and without alteration for the duration of the performance. It is faded out a few seconds after it has reached its upper limit and the clarinetists has stopped playing.
*/


s.boot;


(
{
	var dur, fade, start, end, flat;
	flat = 20; // freq steady time at the beggining and end of the freq sweep. length not specified in score
	dur = 60*20; // total length of the frequency sweep. 20 mins
	fade = 10; // fade in and out. length not specified in the score
	start = 130.8;
	end = 1244.5;
	SinOsc.ar(
		EnvGen.kr(Env.new([start, start, end, end], [flat, dur])).poll // env controls the freq of Osc
	)
	*
	EnvGen.kr(Env.new([0, 1, 1, 0], [fade, dur])) // fade in/out

}.scope
)





