PGDMP                      |            MOVIE    16.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16706    MOVIE    DATABASE     �   CREATE DATABASE "MOVIE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "MOVIE";
                postgres    false            �            1259    16932    info    TABLE       CREATE TABLE public.info (
    other_id integer NOT NULL,
    language character varying(150),
    vote_count double precision,
    release_date date,
    production_company character varying(250),
    censorship character varying(150),
    movie_id integer
);
    DROP TABLE public.info;
       public         heap    postgres    false            �            1259    16931    info_other_id_seq    SEQUENCE     �   CREATE SEQUENCE public.info_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.info_other_id_seq;
       public          postgres    false    220                       0    0    info_other_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.info_other_id_seq OWNED BY public.info.other_id;
          public          postgres    false    219            �            1259    16913    movie    TABLE     �   CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    title character varying(150),
    genres character varying(150),
    budget integer,
    popularity double precision,
    revenue double precision
);
    DROP TABLE public.movie;
       public         heap    postgres    false            �            1259    16912    movie_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.movie_movie_id_seq;
       public          postgres    false    216                       0    0    movie_movie_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;
          public          postgres    false    215            �            1259    16948    new_info    TABLE     �   CREATE TABLE public.new_info (
    language character varying(150),
    production_company character varying(250),
    censorship character varying(150)
);
    DROP TABLE public.new_info;
       public         heap    postgres    false            �            1259    16920    technicalities    TABLE     �   CREATE TABLE public.technicalities (
    tech_id integer NOT NULL,
    runtime integer,
    director character varying(150),
    keywords character varying(150),
    movie_id integer
);
 "   DROP TABLE public.technicalities;
       public         heap    postgres    false            �            1259    16919    technicalities_tech_id_seq    SEQUENCE     �   CREATE SEQUENCE public.technicalities_tech_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.technicalities_tech_id_seq;
       public          postgres    false    218                       0    0    technicalities_tech_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.technicalities_tech_id_seq OWNED BY public.technicalities.tech_id;
          public          postgres    false    217            `           2604    16935    info other_id    DEFAULT     n   ALTER TABLE ONLY public.info ALTER COLUMN other_id SET DEFAULT nextval('public.info_other_id_seq'::regclass);
 <   ALTER TABLE public.info ALTER COLUMN other_id DROP DEFAULT;
       public          postgres    false    220    219    220            ^           2604    16916    movie movie_id    DEFAULT     p   ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);
 =   ALTER TABLE public.movie ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    216    215    216            _           2604    16923    technicalities tech_id    DEFAULT     �   ALTER TABLE ONLY public.technicalities ALTER COLUMN tech_id SET DEFAULT nextval('public.technicalities_tech_id_seq'::regclass);
 E   ALTER TABLE public.technicalities ALTER COLUMN tech_id DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16932    info 
   TABLE DATA           v   COPY public.info (other_id, language, vote_count, release_date, production_company, censorship, movie_id) FROM stdin;
    public          postgres    false    220   �        �          0    16913    movie 
   TABLE DATA           U   COPY public.movie (movie_id, title, genres, budget, popularity, revenue) FROM stdin;
    public          postgres    false    216   �+       �          0    16948    new_info 
   TABLE DATA           L   COPY public.new_info (language, production_company, censorship) FROM stdin;
    public          postgres    false    221   n9       �          0    16920    technicalities 
   TABLE DATA           X   COPY public.technicalities (tech_id, runtime, director, keywords, movie_id) FROM stdin;
    public          postgres    false    218   �=                  0    0    info_other_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.info_other_id_seq', 159, true);
          public          postgres    false    219            	           0    0    movie_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movie_movie_id_seq', 159, true);
          public          postgres    false    215            
           0    0    technicalities_tech_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.technicalities_tech_id_seq', 159, true);
          public          postgres    false    217            f           2606    16939    info info_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (other_id);
 8   ALTER TABLE ONLY public.info DROP CONSTRAINT info_pkey;
       public            postgres    false    220            b           2606    16918    movie movie_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            postgres    false    216            d           2606    16925 "   technicalities technicalities_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.technicalities
    ADD CONSTRAINT technicalities_pkey PRIMARY KEY (tech_id);
 L   ALTER TABLE ONLY public.technicalities DROP CONSTRAINT technicalities_pkey;
       public            postgres    false    218            h           2606    16940    info info_movie_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 A   ALTER TABLE ONLY public.info DROP CONSTRAINT info_movie_id_fkey;
       public          postgres    false    220    216    4706            g           2606    16926 +   technicalities technicalities_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.technicalities
    ADD CONSTRAINT technicalities_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);
 U   ALTER TABLE ONLY public.technicalities DROP CONSTRAINT technicalities_movie_id_fkey;
       public          postgres    false    218    4706    216            �   A  x��Y�r�8}&��O��p�<:�m&ײ�d�j_`��0�HEe���m��EegR�JR6��}�}$�[�޸��qE1�B�U��n[��M���u�]W_*�h���]����{1�/��s��M}�-��W9X�n�v�.*�XB29�z�%��^���|���m}ֺM0X}~S1ĳ=���#^`� ��f������sX� ��Hd�oz!�L� @�g��M�k���[���N8�T�^C�#��)�3���!�I��2	xQid2H�ɘ������"� ��� F�cqQ�)N$� ��W�~)A$����һ�ͮ���۶���Л�PD�Q>�<爁0����֯��)b�!�y��c̛����G�o��0Ԅ#��@h��	�I���4���$A(l��Yח���uɚD���J�X�������{�6�9����Ɍ�D���V�݃��HF!����0n2�� �ɡ�1�Hp�ԅ�QrQ`"e�3�Bݠ3(樧֧޻W"(��@��s�
m&�b��|KOa,)O9��R��44Q��:����j�hf�,+�\]vm�{}��ۭ[�$�1��s�6S��B���f�B1���KтXg����[�6���b����>hd3��0b%�-a��Y.0�XQ;�/[��a��D`�8L-c��#�z('�0���_�:��$��W�w8����sh�@��w�)�2E��|�MAWP��������ݮ�����%�<�A�E���ٮ�'�#�l���f��0A	�/B�S>q�8E�̈́GL�<�� ��I��-�XD9G<3�����
��g��I�CwDb.��0�X�+����z.Cf.C`F#n�w��v�q��F��<�s� �g�k�������,P��&s�Y$r�)l_)>6����y��j%���_�H�C"�\�J<�����)d�` Kf˟Hșb+BN�TH$�L���Y[P!Q	�Gi��n��H���&�t�&�d�gŉ�on��f{S�v덏��Hf�����BBU�	�N�,TgR����!yZH�wlɑ,zG�F��^	Ӈ��q`�"I�d�4��|�
ɢ,��Y�F�Xh�t4JH��?=F�L��)+|�
�\}�?tÞB�rV)���k־$t01���������v�w�<pu����CsI
�7�aH�h�t���� #��Gq�D<R�� �n`7��߭,8�w7���3�'��L�þCT���U}a��n,�!T��i��Ӽq"
)=aT���Ԡ���.�ѳ�H�h���N�> � �c�5�z�_��ۏ�Y�1ґ��Ԓ�+�o�A�4A���i�
�(t�"�b�Y�G�@Z����fH�����'�A��׮����h��'A}���]?NN��HG>��]��D��u�]I � uĈE�xu�����4����_/��l��Ȭ�뢹��Wn�v�����҉���A��g��HG>HS��4�.�]���is��;~8eo��28*�D�<?g�ަ�a02$�^��S"�dh�dU ��@���Á���~}����K?�Х�1dx2V�?��Ef9_24�J�+=N #S��=E|�\u_�Fn$2*.�3�x~U.T��@�Z$^�~�n!���uh�k���$ј�nx�}�m{W' �%���������k����g�>����a�7H��%����R5q'��h��tN"Ο2K�2>UC���S�+� �3t
���e�4:�1��]�l�"5A�d���,a<Q @b�)��*�[^�쉠(�@A�{��s�o
|�6�Hp�����G�D�\B��(Z���7 >��Q�+��޶?����zV'i͋�ꘟ�|���')��n�$$q��q�&��;M��W��IXh]�A!������m��]�B�=E>n�"���
0�m��i�:J8p��qJ�k0���x<Pީ>ۺ�z��J�sJ�B*d*�h;�>�IV���}��@9�c$A6Ħ����[6�;7ض��p}<�7ĭ��R��RJ�U���Tߚv���I#O>vH�����kp�/v�^_��5�HQ}���Q�4�i���E��:��Mʥ��q�렞��M�����&{�Zy���h��� oɹ��t�VM�,CoP����'(F�'�i�$����ص�ˡ��c���@u�?$��iM
��2;�(�+��iW_��@�Uq�!q{�4�����i�Zl/�'����g��X���
(QZ���K�A��(h�1�����^��,�	(at��ZO��Uw�����A�V�ݮ|� i��R}`l�v�?���Gr��V]�|p��xa)�]�a.��20��IX�� �/�k\�f{8 ����"��*<6 S,	s�!N;
4a�p4��=���:Z���n\a&���L�)���7��q��o���Y}��k�����M~6��.yɁ/�۩*#T�(z�B�s�]�6c�2��C]|m��Mнe��@Ϊ?������P�.D�n�{���[��.��<��:D�*��s��� �p1E&�ch�C]�;p��L��L��&�ewߤ��@�"B����{�.��v��љ�+\�V�'�TGAe�?�ԝkh�n[u?l�8#p������2��2��� 	 ��~76�i��ow�AVض�8���U�n~�����a�r1�������`�Ur���,��IK��N���%pJ��W��?�"+�waw$�R�e�4��&d<��S&�߈�w �(Tt F�Mǿ%`���I�/���6���0���f���b��#��B      �   }  x��Y�r�6}��yۭrT�+��I�;���-UR��@3�8�˓��� 97mo��J6��ӧO7(�4����2k�&���ee6���nSVIf�?D�I���[�����w+�R�L��څ]o��,�Jo�lm	��yz�	�\P�҈��m������C΋lm���|>�\|�E�V�P�)�8M��j	��~�+�}���h�Y�SI��dw�KS=��l�j������5����fBJ-`��wc���yn*2�v�}�]��q�$	�<�rUV�����v��.�-�W"RN���z�k�cn�i��؅���$`Bͤ�)��v���\<�fe+�sK����Y�UDg��'�T�װ�p35n�`ŕ�BF���6��WY���6:���Q�2�(�K��<���4�_O���R���I�D����1E6��%�����U'B�!����V���9PX=�C�L�H�X��N] �$�_Lc���������d��	<�f<����9,���+�e��D*����Mz���".�b�3����b�Ƿk�/z��K*&�;�R�D��r�i��x[��bKBnj�7O��b�qǔ\e���?�u���SP��*\ElF�V�}~�X��M	 (f)�1��w�&��a��Z��"�A��-�-���xm֏���x����D�I���%���E����
n�75�]7dB��"�����>�](8cY�|b��)������	�)K�$+g\D�g���qt�O-�O�4�
&�TL��U��M�"���	� ��A�zT�8V˖6XlA��6`ZLOJg�J����.󲭲�����f}@�M�P�(hY�4b)���rV��.�+�p���n��qx0D0 M3�#�s�]9�L�6/%(a�a���c"EBS�me�� �`��SY���]�M����-����'� e�յڂ���(�SP��(��"7�gW��r�
IM�#��p�7���R���r~�@��:˷�&#��L2ӌ�*�	y8������0�SLHF�S�,���9��F�/څٸ���D�'Dt x���0�.��Ψ���i��mzF�L��<���K�lɎȘ�$	I�)Kf2�\���� ������Z�h\�?�  ; '��7l^�(#�9,=�e�e{��!>ݥ�oP���|*�"���NV�CA�䌧)��"��FS�PXV��UF���d��V*	�(Wv�oWfS���)&���A�\I�d	M~*��4�$jr�^:C���q�H	�������l�8��G��E	:a�`�L�t���L.oۢ@�d3l�#����p�W���ԑ�9�C��+���'�`���$���������55F����&�Lp���tu��&�K�q��eܻ�G\#�k�F{`'aՌJ���d_:/�%N���v����RP��_I5��t^ifA;�	�ȌdBΫ*�2vf�4���	��]�K(�VV��(:�}�"	��L������G�r9� 8�Dڦl�$<�Q�:���vΔ~S��7�`�[(�E�(����3@aGJ��>UD�K"���F�G�֮����T
$b��46Fc�Gj(��g����>Q�nl�a���Q�P��hzv���S��RCN.�Y��&�����.���v[{ū�!������i�[Z����[�ldLe������u3#Cv"flD�%��ie��>|@;fv���GM��l%	�{Aa@[� ��&�Ɩ�|@:I�F�7��_-xL�f�"x&JR8�3T�2�/�����Tܕc}}�g���=����VM��O&�����y\e��U[����ʬ�.
&�gT	Њ�������\f����*m�B��e��ֵ��<*���Q��܊C&.����0����y:�H�]�L������x�>�`N=�"��U�6E�?��S��������-CO|X"� ��(L�����{d���5�S=eߝF�t�L����1K���ye��#��O����_6��_��#��^yJ�%���U,���(K��*Ԋ�)яԓ,yz.��
:�X����ݡ]�Ufk'�>���@��i��OҾ�G�6�VŁTQI����^T=�,wL�O}D�L����D�����k��f_&=��$%pD�OC��}�{_�́aw���	��So��T8�ާ�%z�B�ߙ��6/�,?�-vR����fe�fG���r�[���ly\.�J��UF=X�:mW3��� u�$�2���;u~�oݩ.����r����>��T	�5�ꦖv�:�N��m6���XF�+��h�	_�[�|{���."���X���9��U���߻�wp��������r4����&1���W}�ݻA��L`!_�l4��l�_ �#��n��
sZ���K���I9a<��#���#�I������yjdN�]i?�"�@?��ކ��y��tUaR�?��
kN>l �ӗ�Sp3_�a*�;�8N)��
�Cy0��h�ir��1�޷u���^��Y�P�a)~�h�f|F%��vu��S���o�N�?��r��P{xt�'<�Q��:�qa���^jF8N؛��^��5��wk7�/_�����Zzc7�oL�<����x����]b7z��v:�+'���]�.0�O�a����Fm]���y�|0s�t �� ����V�k;�(�5V-������q�����1�_^y�6�C�{E�g����p��J7u���f�Onc�£���>{����X���[X��I_$A���,�1B]��
�]��/��S��N_Y���)9Ϊ���C��%��g�85��\e�}�!���L`7yr�����g�-W���%\�3����@�\{7~A����a�B���=�a:�IT�zU��^Z' ��ߕ��A�`T��>ۓ����a{1��TB~-?g���t��^�� 7Z/�����8�bV�?t�aF��&����NY��c��Y7aBcy��tl|��٢/_w/�614�5Oa"9) �U#P��24Y2��a}tv�)L��5M?=�B�&��>C��G�Cf�	yY��l��p?�L��g��8�bQ!�۳۳���~=;�
0�)� |��.�̶P<揕>L���_'�̷������v�,y��p{��E��"t���`��tX83�qLsM�#d������_ۺ���D�wV(n^�SIɻ����r�T��e�OE�?�d��ֶj�O6/���u7��`��=�����r���yerTJ���]�Ȧ��w5	M
�6k��m����� ��f:q�TR�[XԽn߷e� �W���!��u2B�T�殴o2���l�8�34��2��רz�^�Ҿk�fc�
�i'k��h��{��|,pg���F4lTyN�P;+�(_�n��YE�w�s��,��YE���+      �   r  x��WIw�F>�_ѧ�l^f�C�2�x�����{�R� u�Z��ק���@r��k鯶��gZc%#�Mh�h�k9�M��o� �g�t�l�h@r�-'�yT�������}��?@	���3���/�����P��;��(]�Pk8m��e\����@�G�?~�п��}6�tudO�PC���*��)��)�=�\e�v��W���#�z�� ��W�cr�FW�[S��b���Y����-�JQT���"t�u������k�~�ζ�o�ԗm}�IS�߯�jL6�\?��1���cn�u��j*]�>%����߻��cZkV/��GX���z�$̸�������m;�d��4���ザx�	���Lw�mS��A����:��	{Nv�r�bS�+���ۄ���X���r��K��0\�j��BBT���g��}�6�����Uoي$��\~��9�K��쁐P���$}�A�p�
8���������H�9a#�vR���7��Z������0���joX�s��|$�kH{[��#��l���J"3No6�\5�T&��C���N	�>�͒:%�伐�}�s�0E��(#"���;)B�t��S�Al�*��zr?�BѴP�̵�a���������z=u�<��rn���~��i�B��а5"���#�~��'Q<	�ı��;V^��47}��#�8��p�I9�z�k�k���H��9�a��W&����r�
}fGu���3��(ivu���Ot9{AB��OBM����e\�R��ͤ&B��8��B�<��'i�avr�x@�~�p"�8��QU3����>g�dCH7�	z��R���L�����J6�}�#v��_�.��O���(��.���0.�,��(�$�HA�("?�F�N�֗y�NK�p9&e����Kƾt}ܚ6���ۋ�{R\����ѵ�Z~�]���LC#Ѕ��8�	�z��0[��h���W���e�w,b�TP9.�WQ��_����Ңw�g���F�~dT��53�C�u@T�[��YY���[+���[IB�C��Y��`�|�{�b��a&���E�ĸ�n��n�w��ypg�nvw{�g���ʟm�      �      x��YKv㸒���:�O$����+�e9�'��a)��I���A/�{ا�����7@�g;���A�2���qǼ��>�Fչx�/�j�hU��Z��sY�bs"��LK�q�y��έ�V�LZ97U�Mu">��VXd���:�k��>�J�_깱�b7m��퉘互'�QZ��e���Mr��1�\Y���bgV��D\*��1�Uv:�8!yļ��`ѥ��D���kp���d���+fk��s��︐���4�bC�kߛ�����J�X���'<xmZ�
1�5ϊ�<�y"v��Bm�la���DcOĽzV�R���̋#Ѕ�Ź������AО4�sg^��f���0/�[YI�n���z��L�m!My�W��Nt�+(˼�<�*d���jt%�:��a�n��TH���"�;W�<�{>K���Bٚ���^�X�n��)��S�t*q��^��4bײT����Px�Z$ e����q?f���!fk�
�x��p�Z���j�&;��>�gY �C·��MFP�p�q�8T���C�À]������4�Z�ܡ���j,�i��܋�?�؝jp�kD�fS�!�⓴M�}x�v��{	K<l�W�V�5-ffSVe�c�Zl�pyبʬz���N_J�
��6H�?`���Q&K:ֹ�v#I������?྇_�/A5S�hU�C���Fi�"צ�(�J���T�� akI7?_!Ც�i�}�w�~�=�YȖj���
���K����Hw�Q�V�b_�L�o	텦"��"�ܧP�TwT���;-+��a�?�>R>�3\ǚ��U� ��DJ�m�8�|}e��}^0���rI���[-j�K�\L\���T����|��:��#����g���7t�j6���#���0p&�utT�_��1���YhY���(���nuÂP���]�g��'S� &-�����,�x����c]� P �8h ���e�R���2�Ry*׀D�Y7T���3�� �s�A�'�,i�A�n9�\���!�_���"����D< pD�V)�Z�9��?���їD0�A���m�BE��RF�I3X� ai�AH#�3U�i��z�:P� �A�P:D4��,�1>����n���(����kĤ������jT7`?�6Ex���o��`�%a��,�8��WS:�e�Ԏ�����A�^4Ĺ�0�5����
�*�~���A՛�m�����}FB�>r:�7�[#��2�"�@��_e�g- �,yP@��0�N��Uͮ2���������f	�$Ft���C��c+�f�k��:e�^l���X��p����vl	���G�؉�XR�0��5(��d��˩|�5�rU]Tz1�J����r��ژ�4�b�q�Q�jo�fm�V�;L9ؒ":�%+S�aQ��\��8h���L�Ua��J���-Ω
�ƕ&p���V,�8��?H�L/2��)I�FKrj��#���]��J#2U�c��\�5=݁��* <"�D�}��3 ~��mmF)�"`��khԃEp���uK<#7L=T.ʵF�/RE�xD.!<6m�����U�py���Z�WoB`Ζ-�[�V`/z�bH�1���P�M���gj��ݢ�G�d�R B�������5�"�V�,J���"����,�<a�3[ �T�W�3l�^v'8���c�g�|�Xh��=#�7��.xC������fE��`�a�75z�Sl�a���Xgq�N�����L�U�f~8������m��ZgØ��h.�Ъ� �Gr����h{�_T]O"�@�](��M�T6V�y�0��eްx�c�����jK�ƥƕ��3`�7z��c�ި��Ơ��0�MR�#-����^ۭ�8C�b�} @X��~�R��-�.��<�B��u�8tG�n6R�Vy�/�g�k�+�i[Υfq��#Dߊ��P��(?�<��^���C�ft-�n�j�P �K�&��&ϒ��]\]�M"������h6�{��t�v|@h-��k��ǉK�z%k�G^�tF<X��x#[�����L��7oX��f�n�|{ŉE�s��,yԋ\�a��3u�`��aq�aIf��!7��b��Ը"AaM&��ꮒG�����B��li���{�C=&O�x~�i.ì�d�S�������'��l��/�!*��V��X��Hcv�P�����T���?�#͕s�,	yX �S��Jϻ��;
���L.�~"aI"��� ����Z�����Gu_�ɐ'4<�P�9�4�U���!��Ͷ��'�k�Fб궏ҙ�O�Ӷ9.�$� ��c�K���R"��P���Q��VijM������$�i�`�ј��:}Ac�v�8�ԍkQ@��ӧK�o2kl�\R_z�^����,[3�Ӯ���LE�]��列k%F}�P���i�~�*
y�qg{�l[�M��|)z{˝��pxϐ�����%��6@G�3Ļظ~�35�=O�U�p�8襡v�ԋJ��Q ��j�p�:_?b�t�aJ�����f?�B��1O'�Ǚ�T����a>4�o�?Mx�:����YQh�= �xGu�asPF�Jx��"xl�B�:ສ���a��S|�iP�����`[e�^�%,�rߙ���]��Uc���j,�ht�hd�]K�X�C�AX#,� !h�$�Un��a� 벫v<�w��QM���BN-����p�~�!���q yha�uA�*��)~��iO_�hߔ��s�_+���~7����A��*n�C�^�y��;��;{�L��>�	�9t҆�xA�z��|��E_bw$Bd �HO&X�:���n�{��=s��x��&�t��׍V�CP+Kl�ƛ���m[��&�z���(==)K�W���F���l��=sX��Y��v�@���� T4�Dh�ޢ�Gl�m���u�y{�GR�I�4�t��pW:�ӝ���&�KcO�@(�Y�ֹk����0}��JY�р�~�6g��YK����@�ҹ%q!���`U���5��|�ԖN\��j���4N������*>W�����w/���2n��ɻ��s��@#*���>=�'��65:�]�<g�?�7@��O�.��d�!$V���i�M����6�u�9��*1��vH<Н��Ū�Ʌ��Uk�'x��QI�M��/����w/쇺��y�^�jj��cm�U�<D�/L�W,t}�T�Y���t
z�/ۣc�Ar�N�B���D샃��_��N��� ��,�X�,ТL�Eޮ �h��`�G�R�'_7=qt|���x���c�uq���]���^���M�*�2%qX���^�w���P5b��
#�z#_a�J>��ٺў��lnv�vj��x����F6u�kkėƔ��턄�
��Zs�7�9�h?�K Ax����x�k�e#��L�s�w<�JN����P[h{�#�k(m5�+����|�Vh��p[�I3#��>;|��U4����Yq�>�m'14���hԊ]��p�mݐ�Я=&v VZ�<�;݉�&W��$���c�o0�?����_^��Q�!�H&�z*�N()q-|P�C�X���)&��Ƭ���2�Ơ� *�&�{?zx��X������@0V�ȝ���l�F#�H|Z���X�X䮔��h�y��$l�C`(��������-P�>MPh��u���ˏȒ��1j����E��������Z�h׺.U����*���=7����D�K��Z��XV[ڪׁq�e4V]Ӑ���J�Vp��ǅ�W��_{���U��7Rh�a≇�z��Bw�eWe��4��5�H2����X��~��.yhʌi.��]�Y:��i�!�Es��w��0%���MO@�8v� H:�Ù��J��nB>�x&��3���,|���b��}<��P�G�+)>S1��m��)�4�΄�ftmhH#K1��/�Y?���bW݇,�48!�v���L5b��g� �   �����p�8"�6S�f.�>R�"����d�jl��P��h<�%��un@�B�Rf��W�3 ;�������INM�����u��h{��h�s�_m[�v�@]0��8u�XI�:��k=�n�r���bU�:h��J�mM� �(A���F�\�n2M�ܖ�.����3}ď�7�ix�@
�����}���-5�I���9�?m��     