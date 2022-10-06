import React from 'react';
import './header.css'
import {FiTwitter} from "react-icons/fi";
import{FaInstagram} from 'react-icons/fa';
import {FiFacebook} from 'react-icons/fi';
import {CgMail} from 'react-icons/cg'
const Header = () => {
  return (
             <header className='header'>
              <div className='logo'>
                <h1>ACADEMIA</h1>
                <h2>Online Education and Learners</h2>
              </div>
               <div className='social'>
                <a className='icon'><i><FiTwitter className='icons'/></i></a>
                <a className='icon'><i><FaInstagram className='icons'/></i></a>
                <a className='icon'><i><FiFacebook className='icons'/></i></a>
                <a className='icon'><i><CgMail className='icons'/></i></a>
               </div>
             </header>
    )
}

export default Header