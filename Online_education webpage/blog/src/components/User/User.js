import React from 'react';
import './user.css';
import {FaUserGraduate} from 'react-icons/fa';
import {VscWorkspaceTrusted} from 'react-icons/vsc';
import {GrSchedule} from 'react-icons/gr';
import {FaLaptopCode} from 'react-icons/fa';
const User = () => {
  return (
                     <div className="clients">
                          <div className="container_user">
                            <div className="row">
                            <div className="col-3">
                        
                            <div className='icon_user'>
                                  <FaUserGraduate/>
                          </div>
                         <div className="client">
                                   <h1>3,000</h1>
                                   <p>Sources</p>
                         </div>
                         </div>
                         <div className="col-3">
                         
                         <div className='icon_user'>
                                  <VscWorkspaceTrusted/>
                          </div>
                           <div className="client">
                         <h1>320</h1>
                             <p>Trusted Policey</p>
                          </div>
                          </div>
                          <div className="col-3">
                          <div className='icon_user'>
                                       <GrSchedule/>
                          </div>
                          <div className="client">
                            <h1>1000</h1>
                            <p>Schedules</p>
                          </div>
                           </div>
                          <div className="col-3">
                          <div className='icon_user'>
                                   <FaLaptopCode/>
                          </div>
                          <div className="client">
                            <h1>587</h1>
                            <p>Course</p>
                          </div>
                                    
                         </div>
                                    
                          </div>         
                          </div>           
     </div>                         
                                                  )
}

export default User