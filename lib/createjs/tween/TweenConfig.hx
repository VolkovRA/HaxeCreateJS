package createjs.tween;

/**
 * The configuration properties to apply to Tween instance (ex. {loop:-1, paused:true}).
 * These props are set on the corresponding instance properties except where specified.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/Tween.html
 * @author VolkovRA
 */
typedef TweenConfig =
{
	>AbstractTweenConfig,
	
	/**
	 * Removes all existing tweens for the target when set to true.
	 * Default: false
	 */
	//@:optional var override:Bool; // <-- Haxe has problem with reserved expression in typedef
	
	/**
	 * Allows you to specify data that will be used by installed plugins.
	 * Each plugin uses this differently, but in general you specify data by assigning it to a property of pluginData with the same
	 * name as the plugin. Note that in many cases, this data is used as soon as the plugin initializes itself for the tween.
	 * As such, this data should be set before the first to call in most cases.
	 * <code>myTween.pluginData.SmartRotation = data;</code>
	 * Most plugins also support a property to disable them for a specific tween. This is typically the plugin name followed by "_disabled".
	 * <code>myTween.pluginData.SmartRotation_disabled = true;</code>
	 * Some plugins also store working data in this object, usually in a property named _PluginClassName. See the documentation for
	 * individual plugins for more details.
	 */
	@:optional var pluginData:Dynamic;	
}