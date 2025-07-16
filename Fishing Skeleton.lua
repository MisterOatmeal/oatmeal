-- =========================================
-- SCRIPT REQUIREMENTS
-- =========================================

-- REQUIRED PLUGINS 

    -- ICE
    -- vnavmesh
    -- Artisan
    -- visland
    -- AutoHook

       -- Don't forget to set ICE to "Grab Mission Only".

-- A-3 HYBRID WEATHER UNLOCK REQUIREMENTS:

       -- GOLD ON: CUL: A-3: Loporrit Dietary Improvement III (A-3: Eel Rations)
       -- GOLD ON: GSM: A-3: Vending Machines (A-3: Crystallic Gems)
       -- GOLD ON: FSH: A-1: Fine-grade Water Filter Materials I
       -- GOLD ON: FSH: A-2: Fine-grade Water Filter Materials II
       -- GOLD ON: FSH: A-3: Fine-grade Water Filter Materials III
    
-- AUTOHOOK PRESETS
-- IMPORT THESE BEFORE USING THIS SCRIPT

    -- Clear Skies:
        -- A-2: Refined Moon Gel
        -- AH4_H4sIAAAAAAAACu1XTW/bOBD9KwHPIiBKlET65nrTNICTDeIs9hDsgZJGNhFZdCmq22zg/15QH7Zky3Eb5FAscpPJmTdvRk8z4xc0rYyaidKUs2yJJi/oshBxDtM8RxOjK3CQvZzLAvaXaXd1naKJx7iD7rRUWppnNCEOui4vvyd5lUK6P7b22wbrRqlkZcHqB88+1Tghc9DV5mGloVypPEUT4roD5NehawweDTzcs2Rmq2p9IjFKXHqGUQei8hwS02VCiUv6Zt55FkqnUuQniBAvDAc1pq3bZ1muLp+h7AUODhgHwYBx2L0D8QSLlczMJyFr3vag7A4WRiRPJZoEbVVDdozbR+Ut6p0wEooEenzCQ79wWEGvc9XyP5gJ0yiji3ro7R3U32+9H1Yil+Kp/Cy+KW0BBgddOr4zPL+HRH0DjSbEFmlM2iGzEugF7Or3SS6vxLpOdFosc9BlF8S+7BRN/MilR+wHUGy7ddDld6NF++HZyj+oxb9ic12YShqpiishi64emDhoXmm4gbIUS0AThBx0W5NAt6oA5DQIzxtAE1uYEby5Ks2b8e40lDDOEGF04r6JWN/v+Sw2kBgt8lmlNRTmnbI8QH23XEfZHmU8Gr22agSyMGpjv1dZLBcGNnWj3HNvRTTV70O5D1dz+KuQXyuwuIinLOUB8bEfBRGmacoxi3mASeYHgecGbpgItHXQXJbmz8zGKNHksZGnTWBHkPPTDKd5ftG4HtK8VXot8i9KPVmgrmP8DaL+bc9LMLtvMRN5Cd232V7aBLuvtD1q4CmJbCfqMBdGq6I30s67u37PfQ5LKFKhn9+BVw38h6ri/DDTxsIL+c5gT/ukyRi1vtWDlptTkaLA83cmp2INjF6J1tpZbU8zA3omquXKzOXaDhXSXByKvl4nKt1MLfvQa88jPdiPAn48hl+ZqHYV6LpPJ7N7+FpJDenCCFPZwWZ3jRPaO6OlX5XMhwR+TQJvfee9DucxCm4UEQxe6GKa+YDjKE1wyKmbuVkSUc9H23+6Ftfuo4+7g6bLPb6gfrujAfe80w3vi9psZLG8mFfFMrNu/b5HjgvUSXy8bnUdoDAyEbktliXRGEzXqip65R3bWwN+uHn4wy2QWT6VzkQCi9w2rV2KwZmFK9g66LfZ3/fj881D0zrbk5mtal3Q/hhth6d9bI73Zseydj06UGHkRiSKY4F5mAGmPBBY0Jhil7KMEcIDDoC2zrHKXsnhRqkil+ZiJvTmnML2GvlJKb1ZO+Ma/JDSm6U00FEWUvAJcMzchGHKIMM8Dn2ceHHE3JiJOKFjOiKvrGfzqhD64l5IsRbDFe1DSP9bIcXCY4wKirM04ZhCSjALeIhDcKMwZK7rCVqPxQa313KuID/4DxFw4YeUYMaSCFMvAsyi1McxMEqSxE9DEqHtD1+qcBNcEgAA        
            
        -- A-2: Processed Aquatic Metals
        -- AH4_H4sIAAAAAAAACrVWS2/bOBD+K8WcpUKUaL1urjfNBrDTIHawh2IPtDSyiciiS1Jp0sD/fUE9HEm2Gzfw3qR5fPPNcGbIVxiXWkyY0mqSrSB+hauCLXMc5znEWpZogVFOeYFvyrRV3aQQu2FkwZ3kQnL9AjGx4EZdPSd5mWL6Jjb2uxprJkSyNmDVh2u+Khw/tOB6u1hLVGuRpxATx+kh/x66woiCnofzLpnJuty0DChx6ICCO6DQU4+X4gkhzliu9nAizzHRHUTS9Xff5yNkyll+otbE9f1+tZ3G7ytX66sXVJ3Io0Euo9GgnO15sEecr3mmvzBeMTcC1QrmmiWPCuJRU2E/PATuwboN7B3THIsEO4z8oaPfZ+S1rpL/wgnTdZsc6zk/PACL+kcVNViLNcs5e1Rf2ZOQBq4naLPzrL78HhPxhBJiYop2ggHtkfebgF/46pptqrTHxSpHqdog5vRTiL3AoUPybg8q3O0suHrWkvVmck/AnMtCzH+y7U2hS665KK4ZL9pK28SCaSlxhkqxFUIMYMFtxQluRYHQILxsEWJT8yN4U6H0h/HuJCo8zhBsOKGvI1b6Nz7zLSZasnxSSomFvlCWA9SL5XqU7UHGR6NXVvfGaCLKQqOsPYx9e+p1N8212Jph58VqrnFb7aS3zJqOG8vLJNSFqxg+FPxHiQYXKE1p4C0DO8swsKmfZTZL2NL2wsAJQ0LTMPVhZ8GUK/0tMzEUxN9fq2gmgT3BKDrNcJznn2rXIc1bITcs/1uIRwPULpt/kFX/Rq5Q7+em2tHtIDfKbm0bUQ1PSWC2R4s511IUqwugOl4HdYorLFImXy4F/KDwL1E29q1hLXmnKj001ze5137vZn7S8yC7Bd+gHKyxGS/2KogJ/TyyYMaeu7Lws3M0yoPCheTbfrK15I+SDUauqV3t+Yfp9nw/krB3mFyDaYZ8nGmUE1au1nrKN+ZmJrViOP3V+6yU9d1vPg7um1E0fNf89mVkHlPtVm4H7B5/lFxiOtdMl+Y5YF5rJ6buvCk6eyp6hkcb+ozOPaNFB1ZHu+mstjmrP/6nM/c+fuad3e7QyBtFS9/OvCyyqZ8Sm0UOtZ0lDVKyTFwfI9j92y735kX/fS+o97v5r2+TZpvfSZGgUpjOULPc7PROzIxmaeDh0va8iNg08Fw7TEJq+47nkzAikeMT2P0H6BjEC7AMAAA=

    -- Umbral Wind:
        -- A-3 Crystalline Gems
        -- AH4_H4sIAAAAAAAACs1X227jOAz9lUDPdmE7vr9lMp1ugbQ7aFLMQ7EPskUnQh0rI8m9bJF/H9CXxHaTpi26wObJoczDQ+pIpF/IpNRiSpVW02xJ4hdyXtAkh0mek1jLEgyCizNewH6RtUuXjMROGBnkYrNYSVArkTMSB5ZlkJ+SC8n1M4ltg1yq86c0LxmwvRkRtjX6lRDpCuGrBwefKmQ/HCDbA+S3oSuMKOh5WCfJTFflumXg2pY7oBANKIxbN5HnkOqOp919zzkdV0jGaX6kyrbj+8M6hwMqTm99kogHIHFGc9WG+MHV6vwZVIekN8D0vD6m224RvYf5imf6G+VVkmhQrWGuaXqvSOw1RffD18A9WK+B/Uk1hyKFDiN/6Oj3Gfmtq+T/wpTqWjmHhOmHr8DCQXp2A7ZY0ZzTe/WDPgiJeD1Dm97Y6NtvIBUPIDEfyyC3Cn6toGj2cfq95XKEmtvXZUPkG19e0HVVj0mxzEGqNjgqiJF4HFjuMCunBxVutwY5f9KS9k70jgBu2ELMH+nmstAl11wUF5QX7RaYtkFmpYQrUIougcSEGOS64kSuRQGkQXjeAIlR/QfwZkLpT+P9lKDgMENikiPrdcRqfc9nvoFUS5pPSymh0F+U5QD1y3I9yPZVxgejV2/VeplrscFzzovlXMOmun733BtNTeTXUO7CVRxuC/67BMQlnsUsK8h8M3KYZ7qQMjOhQWYmGcvAsi1m0YxsDTLjSv+dYQxF4ruXKhomsCMYRccZTvJ8VLsOaV4Luab5X0LcI1B7z/wCWv1HuwK9OxnVLdke1WYRE2zPDJoWfA1ycJaaV+uwrh1EWKAm1lxLUSw/E+2KF7uAeK+fWQa5ok9dm4+2XnQn8jvBZ7CEglH5/NlsO1lZWM/vokzyU/XrE/Kjnd/JWhz1fE8iB5xvFSwk39TptXnVlg/lEHgOZl979rM4pIfBzkVnntX5OQbB6eKQI9r7ztGZ9yaZjxemcccbYpJpkFNaLld6xtfY0e16YXh1VMNfKeuZAR/admQfbGzjwIuGE1OAzfHo8INzWnuJt6f1Bn6XXAKba6pLHCtwEDxyhN939HpSfuuMnNb8O8T9PhV33zqozNMS/IA0/gsNjI9v+puD9rbXKJjjOqFtj01GGZhuAGBGNAAzoXbGWJhEkeuQ7T9tp2g+Fu52hrpZ3L2QbtdwvcgJj/eNG/o4uhKiSCRfrvRoIUrsFviR0+0j9utKtWI/UkC3s3KDfXIqymLndMmg0DylOVYUmdbOkzW+tN+Dhv9wyhv3Z9cQyZUyoynMc7y7d4kPR29n8J2Aw/f/5pNrP5t8eiKZP9INWppao4of6aaeU1Rb++7YgoODOY5HU/msNM1x30cXsFYjc4SiH9mkC9HCNns7PB0dJYdu4jAr9E2WZo7pZlZqUgvA9GnoWm6ajS3PrpRcAzc57VikyKE/RKV24gJNwRyHnm26LLHN0APLdFzfS1zbzvzQIds/E2i3L8UPAAA=
        
    -- Moon Dust:
        -- A-3 Eel Rations
        -- AH4_H4sIAAAAAAAACu1YWW/jNhD+Kws+i4UO6vKb1/VmAzgHYhd5CPpASiObCC16KSqbNPB/X1CHLTmyXaQp0AJ5k4cz3xz8ODPwKxqXWk5ooYtJtkSjVzTNKRMwFgKNtCrBQneQ0EKPc76mmst8QvMEdoeLUuUTKQQk+ibLWulkVa6PGBhXM57D3lXaHl2maORGsYVuFZeK6xc0cix0WUyfE1GmkO7FRn9bY11JmawMWPXhmq8KJ4gsdLFZrBQUKylSNHJsu4d8GrrCiMOehX02GJN3GwFxbHImhNaqrt+RihDHdrpW7vkopEo5FUfwHDcIejUmjdk3XqymL1B0EvAPEvD9XgJBewf0EeYrnumvlFdpGEHRCuaaJo8FGvlNVYPoLW4XNW5Qb6nmkCfQiSc4tAv6BXVbU8X/ggnVNTNar4fW7sF1eI31YkUFp4/FN/oklQHoCdp0PKsvv4NEPoFCI8cUaYjaQWQY0XHY1u8rX17QdZXoOF8KUEXrxFx2ikZeaJM30fegou3WQtNnrWjzjE3lF3L+k24uc11y8xAvKM/bemDHQrNSwRUUBV0CGiFkoesqCHQtc0BWjfCyATQyhRnAm8lCvxvvVkEBwxEijI6c1x6r83088w0kWlExKZWCXH9QlgeoH5brYLRvMh70XmnVBJlruTHvlefLuYZN1Sj3sTckGquPCbkLV8XwR85/lGBwEaPgxhQi7HhBgEnk+JgFGcMOowFxnSjLbIa2FprxQt9kxkeBRg81PU0CuwDj+HiEYyG+1KaHYV5Ltabiu5SPBqjtGPdAq99GXoDevcWMigLat9kcmgTbV9qIanjihKYTtZhzrWTeGZAD5je5eLlfQX4t9TjR/Anm4ii27XWwZ7CEPKXq5SS8ES34GtRBb7ni+e7IzJjf7GFvv8uSicPa1BpuEO8U9okeVenFO6C1UHxzzFPou95O5ZivntIJb42eeQ3jTIOa0HK50jO+NmPIqQ8On0m1gJSqnnPmo9PQB7q2F/rx2zl+Ygab5aHtVy0x7+BHyRWkc011aUah2U6OsPUM+/42jz4p8C4KvPfOOz3RCUMvBkqw7fgpJknqYuYmCXZZGga2DSzIErT9s22KzQb7sBPUffHhFXUbJPFj70QTv6fPRUJFv5E7pwpzmUKueUKFqYbxUiuM17LMe2qV78Ptw+tvgpHxVKqMJk3TG15l/dg/s4P5Wwv9Z1b6/UR99xw1xkYyMVWtCtqdrM08NZ+1eK82xNsOx8AlEDOSYZcSggnzU8w85uGAUZ/QKHA9P0Nb6y2HyPEEvksh5M8vUxDnWNRe6jC53M7BXSerlgj/Lu8+ifZPiWa7pMc1m5GIeo6LQ+JRTDKfYAppjBM7i2Lmx3YUwiDX7OM5XEmZL7k4y7TPfvW/pZHV41AYEZZkPg4ZhJiwEDC1wxSHkFDmM9t3fbeaiTVuE+IUxF31H5LZ/DtoHkkTyuIMgx94mAQ2xXEWMJz5iRtCCpQGHtr+AjcZhyPcEgAA
        
    -- Astromagnetic Storms Alpha
        -- Sunken Drone Salvage
        -- AH4_H4sIAAAAAAAACu1WTW/bOBD9KwXPEiCK+r65bpoN4GaDKos9BHugxZFNWBZdkmqbDfzfF5REW5LteBvksIe9UcPhmzejxxm+oFmjxZwqreblCmUv6KamywpmVYUyLRtwkNlc8BqOm8xu3TGU+UnqoAfJheT6GWXYQXfq5mdRNQzY0Wz89x3WFyGKtQFrF75ZtThR4qDb3eNaglqLiqEMe94I+XXoFiONRye8q2Tm62Z7IbEAe8EVRhZEVBUU2mYSYA8P3fzrLIRknFYXiGA/ikY1Dvpjn7la3zyDGgQOJ4zDcMQ4sv+AbiBf81J/pLzlbQzKGnJNi41CWdhXNUpOcYeoaY/6QDWHuoABn2h6LhpX0LdHJf8b5lR3yrBRp6f9Sf1Jf/pxTStON+oz/S6kARgZbDrEGdu/QiG+g0QZNkU6J+0oMRIYBLT1+8hXt3TbJjqrVxVIZYOYn81QRmIvOGE/gkr2ewfd/NSSji7egYD5EY8i/0F3d7VuuOaivqW8tuVxsYMWjYQvoBRdAcoQctB9ywndixpQj/C8A5SZOp3BWwil34z3IEHBeYbIRRf2u4jt/pFPvoNCS1rNGymh1u+U5QT13XI9y/Yk47PRW69OL7kWO3N9eb3KNezavnnk3mtqJt+H8hCu5fBHzb81YHAR8SEt0hi7PpShGwAmbgIedUnoFbBMUkqSFO0dtOBK/16aGAplTy9tNJPAgWCaXmY4q6oP3dEpzXsht7T6TYiNAbIN5E+g7bexK9CHm1HSSoG9qv2mSdDemd7UwQc4No3JYuZainpw0a4f98jg+AJWUDMqn38Z4ZNoltU0pc7Dj9KDw5HfRZcRhzNej5LvLkWKQ58cXC7FGjm9Eq33MyKelRrknDartV7wrRkmuNuYqrt9RjSym1ZmYTsmPtt7SRymp+P3lUlqngC2zVg9fYVvDZfAck11YwaaeWNcENkV0fxrbfwvgV+XAHn7Px+0spAlSRAFpRvQxHcDzAKXhiF2izDwCCxpUoYx2v9le1n/Dn06GLp29vSChn0tCFPySmfLm3oD9YdPctqD8WlxrLzP16ytAdSaF7QyhTIEOofZVjT1oLQ9renzgoyfeokh0MiSFpBXpkMd8gmvvKrCvYP+M4/041B88yjMf9CdscxNGdsKDodjPxLNsjMf3U417PnBeHrGELOYha4XFb4blDhyl1EZuBGhnl9GjPhe0Uqugx6IxipmABYVPiEMCjdhxdINvLJ0U98nLiwZJpDiZIkZ2v8DJmoaUbINAAA=
        
    -- Sporing Mist
        -- Mutated Fish
        -- AH4_H4sIAAAAAAAACu1XTW/bOBD9KwXPIiBKFPVxc71JNoCTDeos9hDsgRJHNhFFdCmqbTbwfy+oD1ty7DgJjCIF9iYP+d68GQ6H4yc0qY2a8spU03yBkid0VvK0gElRoMToGhxkF2eyhO2i6JcuBUq8KHbQjZZKS/OIEuKgy+rsR1bUAsTWbPevW64rpbKlJWs+PPvV8LDIQRer26WGaqkKgRLiuiPml6kbjjgcIdyjYqbL+uFAYJS49IiinkQVBWTmMA8ZorzjopQWkhcH+IjH2CjltIOdy2p59ghVn1FK3GAngCAYBcD6I+H3MF/K3HzmsgnDGqreMDc8u69QEnRJZtFz3iFr3LHecCOhzGCgh+3i2DihXg/V8j+YctMWSu91F+3tHIffoW+XvJD8vjrn35S2BCNDH47vjO1fIFPfQKOE2CTtq3QW2YoYOOzz91kuLvhDE+ikXBSgq96JPWyBEj906TP1I6povXbQ2Q+j+egebgTYg7hV8+98dVmaWhqpygsuyz49mDhoVmu4gqriC0AJQg66bjSha1UC6hgeV4ASm6c9fDNVmXfz3WioYL9ChNGB9dZjs77VM19BZjQvprXWUJoTRbnDerJY96p9FvFe782uc6UzaG7Zd77qD7storlRK3unZbmYG1g1vXUbUFdoE32aOIZ0jbC/S/m1BsuLKCMkyPMUe5QSTHPfxWnqMswIyyDNUypCD60dNJOV+Su3PiqU3D013mwA7xZ4rfQDL/5U6t5S9P3kH+DNb2uvwGwuSs6LCvqb2y0Os9qZWnpKQtunes650aoc3LvjcNcfwGewgFJw/XgCXQ3xH6pOi2ORjoAeize4bTQHt7xG8R7wrZarN+oKA8/fIA8pG216u7YObm/MJDegp7xeLM1MPtjnjLQLu1epmWtq3b6X9mPwMLQ9O4ifDwAvPN52COk7W1+zX+BrLTWIueGmtm+onXJeWcivq9fXgd9crb+gKF+N/Ci1+gbs71vCg74v0jT1M0GwcAMPU8oZjhhj2M8DFyjLA4Acrf/tG3832N9tDG3vv3tCw0eABjENDr8DV0qVhVwszaebAjI1ehLIS/m5FFAamfHCJsU6azdMHlRdjrY1EnaHMX88GEfWU61znsG8sJ16oz04MoMGawd9mH8422nh3U+wBVvL1KaxyeBwauhmBfvZmrfb9tXroLailIJICcMhiSJMWRTi2A8jHHtZQGLggkY5WjvPa4cdDmBWl7wyqoSPVjv7/hX+X0rOiUqJ8NyL80jgVKQU0zwMceqRDPMw5iILgLLIbdpUy9s3mtpwA8LyfhqPu24aBmHMYgwi55gCuJiDcHFAYsKCHDKfcLT+CbO8lpA6EQAA

    -- Astromagnetic Storms Beta
        -- Edible Fish
        -- AH4_H4sIAAAAAAAACu1WS4/bOAz+K4XONuCHbMu+pdl0doB0dlBPsYfBHhSJToRRrFSWu80O8t8L+ZHYnmSyWwwWPfQmU+THjzRF8hnNaqPmtDLVvFij7BktSrqSMJMSZUbX4CB7uRQlnC55f3XLURaQ1EH3WigtzB5lvoNuq8U3JmsO/CS2+ocW66NSbGPBmkNgTw1OTBx0s3vYaKg2SnKU+Z43Qn4dusFIk5GFd5XMfFNvLwSGfQ9fYdSDKCmBmT4S7Hv+UC24zkJpLqi8QMQP4niUY9yZfRDVZrGHauA4mjCOohHjuP8H9AnyjSjMeyoa3lZQ9YLcUPZUoSzqshqTl7hD1LRDvadGQMlgwCee2sXjDAa9qRb/wJyatjJ6r1PrYJL/sLN+2FAp6FP1gX5V2gKMBH04oTOWfwKmvoJGmW+TdK60Y2JLYOCwz997sb6h2ybQWbmWoKveif3ZHGVh4uEX7EdQ5HBw0OKb0bR7eDbzDyr/m+5uS1MLI1R5Q0XZ58P1HbSsNXyEqqJrQBlCDrprSKA7VQJyWoT9DlBmE3MGb6kq88N49xoqOM8QuejCfeuxuT/xyXfAjKZyXmsNpXmjKCeobxbrWbYvIj7rvdFqCyQ3amffqyjXuYFd0yhP3Lsimum3oTyEazh8LsWXGiwuSgmPAxZzl4YQuzgKmLsKMHW5h0OvSIgXkQQdHLQUlfmjsD4qlD225WkDOBJM08sMZ1K+a02nNO+U3lL5u1JPFqjvGH8Cbb6tvAJzfIsFlRX0b7O7tAH2r7QTtfDYT2wn6jFzo1U5GGnXzb1wYL6ENZSc6v1/RvhN1Ss5DanVCOL0qHDid1FlxOGM1oMWu0uekigIjyqXfI2UXvHW6dkinhUG9JzW641Ziq2dHn57Ma3uZm+odTue7GHQh9sWGaUvB+wrs9IO+b6v9AX0Cb7UQgPPDTW1HVl2i7hQVVeq5F8Xw69//r/+80HvokXEGYm5yyjHLmYQuqlHqFtEBWEYQg84Roe/+ubVbZqPR0Hbvx6f0bCR4SgN48utbEm3UBql6+27G6B7Mepo/msJuuVQGsGotFmx3lqF2VbV5Uit4TDdFsLx5kasp1oXlEEubf85v7NGaXRlZ4oODvppVvDTBEQ/OvessZXMbVabhA4nYTf/7LEVn9TO1e+g1jwOMVmtAheveOHigqQuTdnKTTBlPCh4wb2iqbUWt6O44GIloSmvEVrISEGDCFyK08DFAMQlhGEXYxJHSRgWCfjo8B3icVVDjg0AAA==

-- To Dos:

-- Scalablility... 
    -- developing a reliable AH preset portfolio
    -- allow user to select mission types in ICE
    -- parse the mission, then apply the correct preset & mission location, path to mission
    
-- Clean up code... I have no fucking clue what I'm doing. MyFirstScript(tm)

-- =========================================
-- USER CONFIGURATION SECTION
-- =========================================

-- Gearset name for Fisher (change if needed)
FisherGearset = "Fisher"

-- Autohook Preset map: missionId -> Change your AutoHook preset names to match the following, or modify based on MissionID.

-- If you modify this, you will need to provide your own missionID and preset. Then you will need to add it to the mission library.

-- Don't forget to set ICE to "Grab Mission Only".

-- AUTOHOOK PRESET MAP. If you add more missions, you will need to add the corresponding preset name and mission ID here.

local presetMap = {
    [509] = "MoonGel",
    [508] = "ProcessedMetals",
    [510] = "CrystallicGems",
    [511] = "EelRations",
    [543] = "SunkDrone",
    [544] = "MutatedFish",
    [542] = "EdibleFish",
}

-- =========================================
-- LIBRARIES
-- =========================================

import("System.Numerics")

-- Fishing Holes (Sinus Ardorum) and Vectors (for pathfinding)

local fishingHoles= {
    ["Palus Arsenici"]       = { x = 561.7,  y = 51.1,  z = 533.1 , route = "SURF PALUS ASSINIRE 100% GUARANTEED" },    
    ["Hollow Harbor"]        = { x = -561.5, y = 68.9,  z = -647.8, route = "BASE TO HOLLOW HARBOR 99% GUARANTEE SPECIAL" },
    ["Northward Hop-print"]  = { x = -126.6, y = 19.8,  z = -267.9, route = "NORTH HOP-PRINT SURELY" },
    ["Southeast Well"]       = { x = 182.8,  y = 17.5,  z = 191.5, route = "SURF TO THE WELL (SOUTHEAST) MAJOR BIGLY" },
    ["Weeping Pool"]         = { x = 79.7,   y = 18.3,  z = -249.3, route = "YOSHIP'S CASUALS TEAR COLLECTION" },
    ["Westward Hop-print"]   = { x = -257.8, y = 22.0,  z = -87.9, route = "OUEST HOP-PRANT" },
    ["Glimmerpond Alpha"]    = { x = -688.1, y = 57.1,  z = 398.9, route = "GIGALPHAPOOCHAD" },
    ["Glimmerpond Beta"]     = { x = -357.5, y = 47.8,  z = 639.8, route = "GIGAPOOBETASISSY" },
    ["Aetherial Falls"]      = { x = 921.4,  y = -59.0, z = -347.7, route = "REALLY???????? FUCK WATERFALLS" },
    ["Critical_Drone_LOC"]  = { x = -124.4, y = 20.1, z = -286.3, route = "SUNKEN DRONK" },
    ["Critical_EdibleFish_LOC"] = { x = -297.8, y = 22.9, z = -95.5, route = "EDIBLE WHAT" },
    ["Critical_Drone_TurnIn"] = { route = "dead ai lol" },
    ["Critical_EdibleFish_TurnIn"] = { route = "mmmm edibles" },
}

-- Notes: Well built for scalability, Needs testing. Visland routes developed for fishingholes, fallback coords.

-- Need to add coordinates for collection NPCs during critical missions.

-- Mission Library

local FishingMissions = {


        -- Prerequisite Missions (Sequential FSH A-1 to A-3)
    {
        id = 485,
        name = "A-1: Fine-grade Water Filter Materials I",
        hole = "Westward Hop-print",
        coords = fishingHoles["Westward Hop-print"],
        requiresCrafting = false,
    },{
        id = 486,
        name = "A-2: Fine-grade Water Filter Materials II",
        hole = "Weeping Pool",
        coords = fishingHoles["Weeping Pool"],
        requiresCrafting = false,
    },{
        id = 487,
        name = "A-3: Fine-grade Water Filter Materials III",
        hole = "Hollow Harbor",
        coords = fishingHoles["Hollow Harbor"],
        requiresCrafting = false
    },

        -- A-3 Weather-Based Hybrid Missions
    {
        id = 510,
        name = "A-3: Crystallic Gems",
        itemId = 45935,
        amount = 2,
        weatherId = 49,  -- Umbral Wind
        weatherName = "Umbral Wind",
        hole = "Palus Arsenici",
        coords = fishingHoles["Palus Arsenici"],
        requiresCrafting = true,
    },{
        id = 511,
        name = "A-3: Eel Rations",
        itemId = 45934,
        amount = 2,
        weatherId = 148,  -- Moon Dust
        weatherName = "Moon Dust",
        hole = "Hollow Harbor",
        coords = fishingHoles["Hollow Harbor"],
        requiresCrafting = true,
    },

        -- A-2 Clear Skies Hybrid Missions
    {
        id = 509,
        name = "A-2: Refined Moon Gel",
        itemId = 45922,
        amount = 3, -- Low GP Cost
        weatherId = 1,  -- Clear Skies
        weatherName = "Clear Skies",
        hole = "Westward Hop-print",
        coords = fishingHoles["Westward Hop-print"],
        requiresCrafting = true,
    },{
        id = 508,
        name = "A-2: Processed Aquatic Metals",
        itemId = 46973,
        amount = 2, -- Stupidly high GP cost for triplehooking
        weatherId = 1,  -- Clear Skies
        weatherName = "Clear Skies",
        hole = "Southeast Well",
        coords = fishingHoles["Southeast Well"],
        requiresCrafting = true,
    },

        -- Critical Fishing Missions (α variant only)
    {
        id = 543,
        name = "Sunken Drone Salvage",
        itemId = 45939,
        amount = 3,
        weatherId = 149,  -- Astromagnetic Storms (α)
        weatherName = "Astromagnetic Storms",
        hole = "Northward Hop-print",
        coords = fishingHoles["Northward Hop-print"],
        turnIn = "Critical_Drone_TurnIn",
        requiresCrafting = false,
    },{
        id = 544,
        name = "Mutated Fish",
        itemId = 45945,
        amount = 3,
        weatherId = 197,  -- Sporing Mist (β)
        weatherName = "Sporing Mist",
        hole = "Weeping Pool",
        coords = fishingHoles["Weeping Pool"],
        turnIn = {x = 0, y = 0, z = 0}, --finish this
        requiresCrafting = false,
    },{
        id = 542,
        name = "Edible Fish",
        itemId = 45937,
        amount = 3,
        weatherId = 196,  -- Astromagnetic Storms (β)
        weatherName = "Astromagnetic Storms",
        hole = "Northward Hop-print",
        coords = fishingHoles["Northward Hop-print"],
        turnIn = "Critical_EdibleFish_TurnIn",
        requiresCrafting = false,
    },

        -- Meteor Showers (α): Reserved for Future Expansion
    {
        id = 998,
        name = "Meteor Shower Variant (Placeholder - Alpha)",
        itemId = nil,
        amount = nil,
        weatherId = 194,  -- Meteor Showers α
        weatherName = "Meteor Showers (A)",
        hole = nil,
        coords = nil,
        turnIn = nil,
        requiresCrafting = nil,
    },

        -- Meteor Showers (β): Reserved for Future Expansion
    {
        id = 999,
        name = "Meteor Shower Variant (Placeholder - Beta)",
        itemId = nil,
        amount = nil,
        weatherId = 195,  -- Meteor Showers β
        weatherName = "Meteor Showers (B)",
        hole = nil,
        coords = nil,
        turnIn = nil,
        requiresCrafting = nil,
    }
}

-- =========================================
-- PLUGIN CHECKS
-- =========================================

function HasPlugin(name)
    for plugin in luanet.each(Svc.PluginInterface.InstalledPlugins) do
        if plugin.InternalName == name then
            return true
        end
    end
    return false
end

function CheckPlugins()
    local plugins = {
        AutoHook = HasPlugin("AutoHook"),
        Artisan = HasPlugin("Artisan"),
        ICE = HasPlugin("ICE"),
        vnavmesh = HasPlugin("vnavmesh"),
        visland = HasPlugin("visland"),
}
    local missing = {}
    for name, found in pairs(plugins) do
        if not found then
            table.insert(missing, name)
        end
    end
    if #missing > 0 then
        for i, name in ipairs(missing) do
            yield("/echo You're missing these plugins: " .. name)
        end
        yield("/wait 0.2")      
        yield("/snd stop all")
        return false
    end
    return true
end

-- =========================================
-- GEARSET CHANGE
-- =========================================

function EquipFisher()
    if classId ~= 18 then
        yield("/gs change " .. FisherGearset)
        yield("/wait 0.5")
    end
end

-- =========================================
-- WKSMISSIONINFORMATION CHECK
-- =========================================

function EnsureMissionWindowOpen()
    if not Addons.GetAddon("WKSMissionInfomation").Ready then
        yield("/callback WKSHud true 11")
        yield("/wait 0.2")
    end
end

-- =========================================
-- MISSION IDENTIFICATION (PARSE NODE 29)
-- =========================================

local iceStarted = false

function GetActiveMission()
    if not iceStarted then
        yield("/ice start")
        yield("/wait 2")  
        iceStarted = true
    end

    while true do
        EnsureMissionWindowOpen()
        if Addons.GetAddon("WKSMissionInfomation").Ready then
            local missionName = Addons.GetAddon("WKSMissionInfomation"):GetNode(1,3).Text
            for _, mission in ipairs(FishingMissions) do
                if mission.name == missionName then
                    return mission
                end
            end
        end
        yield("/wait 0.5")
    end
end

local mission = GetActiveMission()
if not mission then
    yield("No active mission detected. You have to select missions in ICE in order for this script to proceed.")
    return
end

function IsCriticalMission(mission)
    return mission.id == 542 or mission.id == 543 or mission.id == 544
end

function GetDistanceToTarget(targetCoords)
    local playerX = Player.Pos.x
    local playerY = Player.Pos.y
    local playerZ = Player.Pos.z
    local distance = math.sqrt((playerX - targetCoords.x)^2 + (playerY - targetCoords.y)^2 + (playerZ - targetCoords.z)^2)
    return distance
end

-- =========================================
-- AUTHOOK PRESET SELECTION
-- =========================================

function AutoHookPresetByMission(missionId, missionName)
    local preset = presetMap[missionId]
    if preset then
        IPC.AutoHook.SetPreset(preset)
        if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
            IPC.AutoHook.SetPluginState(true)
        end
        yield('/echo Set AutoHookingway to preset "' .. preset .. '" for mission "' .. (missionName or "?") .. '".')
    else
        yield('/echo No matching AutoHook preset for mission "' .. (missionName or "?") .. '" (ID ' .. tostring(missionId) .. ').')
        yield("/snd stop all")
        return false
    end
    return true
end

-- =========================================
-- PATHING TO FISHING LOCATION
-- =========================================

function MoveToTarget(holeName)
    -- Find the data for the requested fishing hole
    local holeData = fishingHoles[holeName]

    -- Check if the hole from the mission associated with the new mission is different. (i.e. diff mission, diff hole))
    if holeData and holeData.route and holeData.route ~= "" then
        local routeName = holeData.route
        yield('/echo Moving to ' .. holeName .. ' using Visland route: ' .. routeName)
        yield('/visland execonce "' .. routeName .. '"') -- Start the Visland route, do once
        yield("/wait 0.5") -- A small wait for movement to start
        while Player.IsMoving do
            yield("/wait 0.5")
        end
        yield('/echo Arrived at ' .. holeName .. '.')
        return true
    else

        yield('/echo ERROR: No Visland route found for Mission at "' .. holeName .. '". Stopping script.')
        yield("/snd stop all")

        return false
    end
end

-- =========================================
-- FISHING AND (OPTIONAL) CRAFTING STEP
-- =========================================

function PerformFishingMission(mission)
    if IPC and IPC.AutoHook and IPC.AutoHook.SetPluginState then
        IPC.AutoHook.SetPluginState(true)
    end
    while Inventory.GetItemCount(mission.itemId) < (mission.amount or 1) do
        yield("/wait 1")
    end

    -- Wait until not actively fishing (Condition[43] == false)
    while Svc and Svc.Condition and Svc.Condition[43] do
        yield("/wait 0.2")
    end

    -- If still "locked" at water (passive), force stand up and wait
    if Svc and Svc.Condition and Svc.Condition[6] then
        yield("/ac quit")
        while Svc.Condition[6] do
            yield("/wait 0.2")
        end
    end

    yield("/echo Astronauttingway. Fishing complete. Proceed.")
end

function DoCraftingStep(mission)
    -- Check mission crafting requirement. For my hybrids baby.
    if not mission.requiresCrafting then
        return
    end

    EnsureMissionWindowOpen()

    yield("/wait 0.5")
    yield("/click WKSMissionInfomation Synthesize")
    IPC.Artisan.SetEnduranceStatus(true)
    yield("/wait 0.2")

    while Svc and Svc.Condition and Svc.Condition[40] do
        yield("/wait 0.5")
    end
    while Svc and Svc.Condition and Svc.Condition[5] do
        yield("/wait 0.5")
    end
    yield("/echo Crafting complete. Trust me, you dont want to submit it on this job. Artisanway is better for that.")
end

-- =========================================
-- TURN IN MISSION
-- =========================================

function SubmitMission(mission)
    
    EquipFisher()

    if IsCriticalMission(mission) then
        MoveToTarget(mission.turnIn)
        yield('/target "Collection Point"')
        yield("/wait 0.5")
        yield("/interact")
        yield("/wait 2")
    else

        EnsureMissionWindowOpen()
        yield("/click WKSMissionInfomation Report")
        yield("/wait 1")
    end
end

-- =========================================
-- LOOP
-- =========================================

while true do
    if not CheckPlugins() then return end

    EquipFisher()

    local mission = GetActiveMission()

    if not mission then
        yield("/echo No active mission detected. Waiting...")
        yield("/wait 5")
        yield("/echo Well, this party is over. We don't have a damn mission to do.")
        yield("/snd stop all")
        goto continue
    end

    local distance = GetDistanceToTarget(mission.coords)

    if distance > 5 then
        yield('/echo You might have just gotten a newer, shittier mission. HAH! You are too far from target. Moving to next location.')
        yield('/ac "Stellar Return"')
        yield("/wait 10") -- Wait for teleport to complete
        MoveToTarget(mission.hole)
    end

    AutoHookPresetByMission(mission.id, mission.name)
    PerformFishingMission(mission)
    DoCraftingStep(mission)
    SubmitMission(mission)
    yield("/wait 2")
    ::continue::

end
