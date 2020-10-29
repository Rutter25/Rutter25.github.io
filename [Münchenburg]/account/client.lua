local sx, sy = guiGetScreenSize();
local relX, relY = sx/1366, sy/768;

local isAccountShowing = true;
local isAccountPanelState = 1

local panelPosition = {0.3,0,3}
function showClientImage()
  -- guiCreateStaticImage( 0, 0, relX, relY, "myimage.png", true )
  
end
addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource() ), showClientImage );
addEventHandler("onClientRender",resourceRoot,
function()
 dxDrawRectangle(sx*(panelPosition[1]),sy*(panelPosition[2]),sx*0.4,sy*0.5,tocolor(31, 30, 36,230),false);
end
 );