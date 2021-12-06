import axios from "axios";
import React, { useState } from "react";


const SignUp = ()  => {
    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [passwordConfirmation, setPasswordConfirmation] = useState("");

    const handleSubmit = async (e) => {
    e.preventDefault();
    let user = {
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
    }
    console.log(user)
    try {
      const data = await axios.post(
        "/auth/signup",
        {user},
        {withCredentials: true}
      );
      console.log(data)
    } catch (error) {
        console.log(error);
      }
    };
    

        return (
            <form onSubmit={handleSubmit}>
                <h3>Sign Up</h3>

                <div className="form-group">
                    <label>Username</label>
                    <input 
                        type="text" 
                        className="form-control" 
                        placeholder="Username" 
                        onChange={(e) => setUsername(e.target.value)}
                        />
                </div>

                <div className="form-group">
                    <label>Email</label>
                    <input 
                        type="email" 
                        className="form-control" 
                        placeholder="Enter email"
                        onChange={(e) => setEmail(e.target.value)} 
                        />
                </div>

                <div className="form-group">
                    <label>Password</label>
                    <input
                        type="password" 
                        className="form-control" 
                        placeholder="Enter password" 
                        onChange={(e) => setPassword(e.target.value)}
                        />
                </div>

                <div className="form-group">
                    <label>Password confirmation</label>
                    <input 
                        type="password" 
                        className="form-control" 
                        placeholder="Enter password confirmation" 
                        onChange={(e) => setPasswordConfirmation(e.target.value)}
                    />
                </div>

                <button type="submit" className="btn btn-primary btn-block">Sign Up</button>
                <p className="forgot-password text-right">
                    Already registered <a href="#">sign in?</a>
                </p>
            </form>
        )
    }

export default SignUp;