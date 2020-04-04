package easeljs.display;

/**
 * The type of compositing operation to apply when drawing new shapes.
 * Documentation: https://developer.mozilla.org/ru/docs/Web/API/CanvasRenderingContext2D/globalCompositeOperation
 * @author VolkovRA
 */
@:enum abstract CompositeOperation(String) to String
{
	/**
	 * This is the default setting and draws new shapes on top of the existing canvas content.
	 */
	var SOURCE_OVER = "source-over";
	
	/**
	 * The new shape is drawn only where both the new shape and the destination canvas overlap.
	 * Everything else is made transparent.
	 */
	var SOURCE_IN = "source-in";
	
	/**
	 * The new shape is drawn where it doesn't overlap the existing canvas content.
	 */
	var SOURCE_OUT = "source-out";
	
	/**
	 * The new shape is only drawn where it overlaps the existing canvas content.
	 */
	var SOURCE_ATOP = "source-atop";
	
	/**
	 * New shapes are drawn behind the existing canvas content.
	 */
	var DESTINATION_OVER = "destination-over";
	
	/**
	 * The existing canvas content is kept where both the new shape and existing canvas content overlap.
	 * Everything else is made transparent.
	 */
	var DESTINATION_IN = "destination-in";
	
	/**
	 * The existing content is kept where it doesn't overlap the new shape.
	 */
	var DESTINATION_OUT = "destination-out";
	
	/**
	 * The existing canvas is only kept where it overlaps the new shape.
	 * The new shape is drawn behind the canvas content.
	 */
	var DESTINATION_ATOP = "destination-atop";
	
	/**
	 * Where both shapes overlap the color is determined by adding color values.
	 */
	var LIGHTER = "lighter";
	
	/**
	 * Only the new shape is shown.
	 */
	var COPY = "copy";
	
	/**
	 * Shapes are made transparent where both overlap and drawn normal everywhere else.
	 */
	var XOR = "xor";
	
	/**
	 * The pixels are of the top layer are multiplied with the corresponding pixel of the bottom layer.
	 * A darker picture is the result.
	 */
	var MULTIPLY = "multiply";
	
	/**
	 * The pixels are inverted, multiplied, and inverted again.
	 * A lighter picture is the result (opposite of multiply)
	 */
	var SCREEN = "screen";
	
	/**
	 * A combination of multiply and screen.
	 * Dark parts on the base layer become darker, and light parts become lighter.
	 */
	var OVERLAY = "overlay";
	
	/**
	 * Retains the darkest pixels of both layers.
	 */
	var DARKEN = "darken";
	
	/**
	 * Retains the lightest pixels of both layers.
	 */
	var LIGHTEN = "lighten";
	
	/**
	 * Divides the bottom layer by the inverted top layer.
	 */
	var COLOR_DODGE = "color-dodge";
	
	/**
	 * Divides the inverted bottom layer by the top layer, and then inverts the result.
	 */
	var COLOR_BURN = "color-burn";
	
	/**
	 * A combination of multiply and screen like overlay, but with top and bottom layer swapped.
	 */
	var HARD_LIGHT = "hard-light";
	
	/**
	 * A softer version of hard-light.
	 * Pure black or white does not result in pure black or white.
	 */
	var SOFT_LIGHT = "soft-light";
	
	/**
	 * Subtracts the bottom layer from the top layer or the other way round to always get a positive value.
	 */
	var DIFFERENCE = "difference";
	
	/**
	 * Like difference, but with lower contrast.
	 */
	var EXCLUSION = "exclusion";
	
	/**
	 * Preserves the luma and chroma of the bottom layer, while adopting the hue of the top layer.
	 */
	var HUE = "hue";
	
	/**
	 * Preserves the luma and hue of the bottom layer, while adopting the chroma of the top layer.
	 */
	var SATURATION = "saturation";
	
	/**
	 * Preserves the luma of the bottom layer, while adopting the hue and chroma of the top layer.
	 */
	var COLOR = "color";
	
	/**
	 * Preserves the hue and chroma of the bottom layer, while adopting the luma of the top layer.
	 */
	var LUMINOSITY = "luminosity";
}