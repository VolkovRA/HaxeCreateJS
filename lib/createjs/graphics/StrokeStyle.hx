package createjs.graphics;

import haxe.extern.EitherType;
import js.html.CanvasRenderingContext2D;

/**
 * Sets the stroke style.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.StrokeDash.html
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/setLineDash
 * @author VolkovRA
 */
@:native("createjs.Graphics.StrokeStyle")
extern class StrokeStyle implements ICommand 
{
	/**
	 * Create a new StrokeStyle command.
	 * @param	width		The width of the stroke.
	 * @param	caps		Indicates the type of caps to use at the end of lines.
	 * 						One of butt, round, or square. Defaults to LineCapType.BUTT.
	 * 						Also accepts the values 0 (butt), 1 (round), and 2 (square) for use with the tiny API.
	 * @param	joints		Specifies the type of joints that should be used where two lines meet.
	 * 						One of bevel, round, or miter. Defaults to LineJoinType.MITER.
	 * 						Also accepts the values 0 (miter), 1 (round), and 2 (bevel) for use with the tiny API.
	 * @param	miterLimit	If joints is set to LineJoinType.MITER, then you can specify a miter limit ratio which controls at
	 * 						what point a mitered joint will be clipped.
	 * @param	ignoreScale	If true, the stroke will be drawn at the specified thickness regardless of active transformations.
	 */
	public function new(	width:Float,
							?caps:EitherType<LineCapType, Int>,
							?joints:EitherType<LineJoinType, Int>,
							?miterLimit:Float = 10,
							?ignoreScale:Bool = false
	);
	
	/**
	 * The width of the stroke.
	 */
	public var width:Float;
	
	/**
	 * Indicates the type of caps to use at the end of lines.
	 * One of butt, round, or square. Defaults to LineCapType.BUTT.
	 * Also accepts the values 0 (butt), 1 (round), and 2 (square) for use with the tiny API.
	 */
	public var caps:EitherType<LineCapType, Int>;
	
	/**
	 * Specifies the type of joints that should be used where two lines meet.
	 * One of bevel, round, or miter. Defaults to LineJoinType.MITER.
	 * Also accepts the values 0 (miter), 1 (round), and 2 (bevel) for use with the tiny API.
	 */
	public var joints:EitherType<LineJoinType, Int>;
	
	/**
	 * If joints is set to LineJoinType.MITER, then you can specify a miter limit ratio which
	 * controls at what point a mitered joint will be clipped.
	 */
	public var miterLimit:Float;
	
	/**
	 * If true, the stroke will be drawn at the specified thickness regardless of active transformations.
	 */
	public var ignoreScale:Bool;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}