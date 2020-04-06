package createjs.display;

/**
 * All the option parameters for StageGL, some are not supported by some browsers.
 * @author VolkovRA
 */
typedef StageGLConfig =
{
	/**
	 * If true, the canvas is NOT auto-cleared by WebGL (the spec discourages setting this to true).
	 * This is useful if you want persistent draw effects.
	 * Default: false
	 */
	@:optional var preserveBuffer:Bool;
	
	/**
	 * Specifies whether or not the browser's WebGL implementation should try to perform anti-aliasing.
	 * This will also enable linear pixel sampling on power-of-two textures (smoother images).
	 * Default: false
	 */
	@:optional var antialias:Bool;
	
	/**
	 * If true, the canvas is transparent.
	 * This is <b>very</b> expensive, and should be used with caution.
	 * Default: false
	 */
	@:optional var transparent:Bool;
	
	/**
	 * Alters color handling.
	 * If true, this assumes the shader must account for pre-multiplied alpha.
	 * This can help avoid visual halo effects with some assets, but may also cause problems with other assets.
	 * Default: false
	 */
	@:optional var premultiply:Bool;
	
	/**
	 * How often the system should automatically dump unused textures with purgeTextures(autoPurge) every autoPurge/2 draws.
	 * See purgeTextures for more information.
	 * Default: 1200
	 */
	@:optional var autoPurge:Int;
}