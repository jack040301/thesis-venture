import React, { useEffect, useCallback } from "react";
import { GoogleReCaptchaProvider, useGoogleReCaptcha } from "react-google-recaptcha-v3";
import { MDBCheckbox } from "mdb-react-ui-kit";


export const ReCapt = ({check, e}) => {
    const {executeRecaptcha} = useGoogleReCaptcha();

    const handleReCaptchaVerify = useCallback(async ()=>{
        if(!executeRecaptcha){
            console.log('Execute recaptcha not yet available');
            return;
        }

        const token = await executeRecaptcha('test');
    }, [executeRecaptcha]);

    useEffect(()=>{
        handleReCaptchaVerify();
    }, [handleReCaptchaVerify]);

    //return (<button onClick={handleReCaptchaVerify} id={id} >verify recaptcha</button>);

    return( <MDBCheckbox checked={check} onClick={handleReCaptchaVerify} label="ReCaptchaV3Sample(Check console for error)" /> );
};