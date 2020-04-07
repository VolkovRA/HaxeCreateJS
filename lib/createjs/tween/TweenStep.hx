package createjs.tween;

import js.lib.Function;

/*
 * The related tween step.
 * This class is currently undocumented.
 * 
 * @author VolkovRA
 */
extern class TweenStep 
{
	public var next:TweenStep;
	public var prev:TweenStep;
	public var t:Float;
	public var d:Float;
	public var props:Dynamic;
	public var ease:Function;
	public var passive:Bool;
	public var index:Int;
}