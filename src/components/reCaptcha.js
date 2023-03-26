import React, { useEffect, useCallback } from "react";
import { GoogleReCaptchaProvider, useGoogleReCaptcha } from "react-google-recaptcha-v3";


export const ReCapt = () => {
    const {executeRecaptcha} = useGoogleReCaptcha();

    const handleReCaptchaVerify = useCallback(async ()=>{
        if(!executeRecaptcha){
            console.log('Execute recaptcha not yet available');
            return;
        }

        const token = await executeRecaptcha();
    }, [executeRecaptcha]);

    useEffect(()=>{
        handleReCaptchaVerify();
    }, [handleReCaptchaVerify]);

    return (<button onClick={handleReCaptchaVerify}>verify recaptcha</button>);
};