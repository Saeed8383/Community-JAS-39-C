
local jas_irist_name = 'IRIS-T IR AAM'
local jas_irist_mass = 87.4
local pylon_mass = 1.0

JAS_IRIST_AA = {
    category        = CAT_AIR_TO_AIR,
    name            = jas_irist_name,
    user_name       = _(jas_irist_name),
    wsTypeOfWeapon  = {4,4,7,WSTYPE_PLACEHOLDER},
    Escort          = 0,
    Head_Type       = 1,
    sigma           = {2, 2, 2},
    M               = jas_irist_mass,
        H_max = 20000.0, 
        H_min = -1,
        Diam = 127.0,
        Cx_pil = 1.88,
        D_max = 20000.0,
        D_min = 200.0,
        Head_Form = 0,
        Life_Time = 60.0,
        Nr_max = 60,
        v_min = 140.0,
        v_mid = 400.0,
        Mach_max = 3.0,
        t_b = 0.0,
        t_acc = 8.0,
        t_marsh = 0.0,
        Range_max = 25000.0,
        H_min_t = 1.0,
        Fi_start = 3.14152,
        Fi_rak = 3.14152,
        Fi_excort = 3.14152, 
        Fi_search = 0.09, 
        OmViz_max = 1.10,
		warhead = enhanced_a2a_warhead(11.4),       
        exhaust = { 0.84, 0.66, 0.43, 0.08 };				
		X_back = -1.6, 
        Y_back = -0.1,
        Z_back = 0.0,
        Reflection = 0.03,
        KillDistance = 8.0,

    --seeker sensivity params
    SeekerSensivityDistance = 25000, -- The range of target with IR value = 1. In meters.
    ccm_k0        = 0.12,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled  = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {
        {
            name     = jas_irist_name,
            file     = 'jas39_iris-t',
            life     = 1,
            fire     = {0, 1},
            username = "IRIST",
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    ModelData = {
        58 ,  -- model params count
        0.4 ,   -- characteristic square (характеристическая площадь)
        
        -- параметры зависимости Сx
        0.040 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
        0.080 , -- Cx_k1 высота пика волнового кризиса
        0.020 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
        0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
        1.0 , -- Cx_k4 крутизна спада за волновым кризисом 
        0.8 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
        
        -- параметры зависимости Cy
        0.9 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
        0.8     , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
        1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
        
        0.7 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
        10.0, --угловая скорость создаваймая моментом газовых рулей
        
        -- Engine data. Time, fuel flow, thrust.    
        --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
        -1.0,        -1.0,    6,          0.0,        0.0,            0.0,        1.0e9,         -- time of stage, sec
         0.0,        0.0,    5.0,        0.0,        0.0,            0.0,        0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
         0.0,        0.0,    12500.0,    0.0,    0.0,            0.0,        0.0,           -- thrust, newtons
    
         1.0e9, -- таймер самоликвидации, сек
         60.0, -- время работы энергосистемы, сек
         0, -- абсолютная высота самоликвидации, м
         0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
         1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
         1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
         0.0,  -- синус угла возвышения траектории набора горки
         30.0, -- продольное ускорения взведения взрывателя
         0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
         1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
         1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
         2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

          -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
		 14.0, 
		 -15.0, 
		 -2.5, 
		 15200, 
		 5200, 
		 25000,
		 9800, 
		 10300, 
		 3000, 
		 1500, 
		 0.5, 
		 -0.015, 
		 0.5,
    },
}

declare_weapon(JAS_IRIST_AA)
JAS_IRIST_AA.shape_table_data.index = JAS_IRIST_AA.wsTypeOfWeapon[4]

declare_loadout({
    category     = CAT_AIR_TO_AIR,
    CLSID        = "{JAS39_IRIS-T}",
    Picture      = 'jas39_irist.png',
    attribute    = JAS_IRIST_AA.wsTypeOfWeapon,
    displayName  = _(jas_irist_name),
    Cx_pil       = 0.00057,
    Count        = 1,
    Weight       = jas_irist_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = 'jas39_iris-t',
        },
    }, -- end of Elements
})

