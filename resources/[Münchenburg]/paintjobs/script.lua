local myShader, bmw1, theTexture;

    function replaceEffect( )
      outputChatBox("Mükszik");
        myShader, bmw1 = dxCreateShader ( 'shader.fx', 0, 0, true, 'vehicle' );
        theTexture = dxCreateTexture( "bmw1.png" );
        dxSetShaderValue( myShader, 'PaintjobTexture', theTexture );
        engineApplyShaderToWorldTexture( myShader, 'copcarsf597body1'); 
    end
addCommandHandler( 'fest', replaceEffect)
