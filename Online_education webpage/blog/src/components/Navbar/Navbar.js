import React, { useState } from 'react';
import './navbar.css';
import {AiOutlineBars} from 'react-icons/ai';
import {ImCross} from 'react-icons/im';
const Navbar = () => {
     const [click,setClick]=useState(false);
     return (
<div className='navbar'>
       <nav className='flexSB'>

            <ul className={click?'mobile-nav':'flexSB'} onClick={()=>setClick(false)}>

                                   <li><a href='#'>Home</a></li>
                    <li><a href='#'>All Courses</a></li>
                    <li><a href='#'>About</a></li>
                    <li><a href='#'>Team</a></li>
                    <li><a href='#'>Pricing</a></li>
                    <li><a href='#'>Journal</a></li>
                    <li><a href='#'>Contact</a></li>
                   
                    </ul> 
                    <div className='start'>
                                        <div className='button'>Get Certificate</div>
                                 </div>
                        <button className='toggle' onClick={()=>setClick(!click)}>
                             {click?<ImCross/>:<AiOutlineBars/>}

                        </button>
       </nav>
  </div>
  )
}

export default Navbar;