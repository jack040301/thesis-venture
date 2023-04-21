import "./cddb.css";
import React, {useState} from 'react';


export const CusDropDown = ({btnName, children}) => {
    const [showme, setShowme] = useState("dd-content-hide");

    const show = () => {
        
        if(showme == "dd-content-hide"){
            setShowme("dd-content");
        }else{
            setShowme("dd-content-hide");
        }
    };

    return(
        <>
            <div class="customDD" id="cdd">
                <button onClick={show} class={"dropbtn"}>{btnName}</button>
                <div id="dd" class={showme} >
                    {children}
                </div>
            </div>    
        </>
    );
}

export const TopFullWidthModal = ({title, showcont, showModal, f}) => {

    return(
        <>
            <div class={showcont}>                
                <div class={showModal}>
                    <div class="m-title">
                        <h5>Pinned locations is limited to {title}</h5>
                    </div>
                    <div class="m-btn">
                        <button onClick={f} class="m-btn-1">OK</button>
                    </div>
                </div>
            </div>
        </>
    );
};